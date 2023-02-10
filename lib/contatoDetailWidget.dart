import 'package:crud01/services/contatoService.dart';
import 'package:flutter/material.dart';
import 'models/contato.dart';

class ContatoDetailWidget extends StatefulWidget {
  ContatoDetailWidget(this.contato);

  final Contato contato;

  @override
  _ContatoDetailWidgetState createState() => _ContatoDetailWidgetState();
}

class _ContatoDetailWidgetState extends State<ContatoDetailWidget> {
  _ContatoDetailWidgetState();

  final ContatoService api = ContatoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Nome:',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8))),
                          Text(widget.contato.nome,
                              style: Theme.of(context).textTheme.titleLarge)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('E-mail:',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8))),
                          Text(widget.contato.email,
                              style: Theme.of(context).textTheme.titleMedium)
                        ],
                      ),
                    ),
                  ]))),
        ),
      ),
    );
  }
}
