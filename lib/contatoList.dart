import 'package:crud01/models/contato.dart';
import 'package:flutter/material.dart';
import 'contatoDetailWidget.dart';

class ContatoList extends StatelessWidget {
  final List<Contato> contatos;

  const ContatoList({super.key, required this.contatos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contatos == null ? 0 : contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContatoDetailWidget(contatos[index])),
              );
            },
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(contatos[index].nome),
              subtitle: Text(contatos[index].email.toString()),
            ),
          ));
        });
  }
}
