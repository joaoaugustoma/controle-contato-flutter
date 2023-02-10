import 'dart:convert';

import 'package:http/http.dart';
import '../models/contato.dart';

class ContatoService {
  final String apiUrl = "http://192.168.1.153:8080/api/v1/contatos";

  Future<List<Contato>> getContatos() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Contato> contatos =
          body.map((dynamic item) => Contato.fromJson(item)).toList();
      return contatos;
    } else {
      throw "Não foi possível carregar a lista de contatos";
    }
  }

  Future<Contato> getContatoById(String idContato) async {
    final response = await get('$apiUrl/$idContato');

    if (response.statusCode == 200) {
      return Contato.fromJson(json.decode(response.body));
    } else {
      throw Exception('Não foi possível buscar um contato por esse ID');
    }
  }

  Future<Contato> createContato(Contato contato) async {
    Map data = {
      'nome': contato.nome,
      'email': contato.email,
      'telefonePrincipal': contato.telefonePrincipal,
      'telefoneSecundario': contato.telefoneSecundario,
      'isContatoPrincipal': contato.isContatoPrincipal
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Contato.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao incluir contato');
    }
  }

  Future<Contato> updateCases(String idContato, Contato contato) async {
    Map data = {
      'nome': contato.nome,
      'email': contato.email,
      'telefonePrincipal': contato.telefonePrincipal,
      'telefoneSecundario': contato.telefoneSecundario,
      'isContatoPrincipal': contato.isContatoPrincipal
    };

    final Response response = await put(
      '$apiUrl/$idContato',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Contato.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao alterar o contato');
    }
  }

  Future<void> deleteCase(String idContato) async {
    Response res = await delete('$apiUrl/$idContato');

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Erro ao deletar o contato";
    }
  }
}
