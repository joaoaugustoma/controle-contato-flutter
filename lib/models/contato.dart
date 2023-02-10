import 'package:crud01/models/telefone.dart';

class Contato {
  final int idContato;
  final String nome;
  final String email;
  final Telefone telefonePrincipal;
  final Telefone telefoneSecundario;
  final bool isContatoPrincipal;

  Contato(
      {required this.idContato,
      required this.nome,
      required this.email,
      required this.telefonePrincipal,
      required this.telefoneSecundario,
      required this.isContatoPrincipal});

  factory Contato.fromJson(Map<String, dynamic> json) {
    return Contato(
      idContato: json['idContato'] as int,
      nome: json['nome'] as String,
      email: json['email'] as String,
      telefonePrincipal: json['telefonePrincipal'] as Telefone,
      telefoneSecundario: json['telefoneSecundario'] as Telefone,
      isContatoPrincipal: json['isContatoPrincipal'] as bool,
    );
  }

  @override
  String toString() {
    return 'Contatos{idContato: $idContato, nome: $nome, email: $email, telefonePrincipal: $telefonePrincipal, telefoneSecundario: $telefoneSecundario, isContatoPrincipal: $isContatoPrincipal}';
  }
}
