import 'package:crud01/contatoList.dart';
import 'package:crud01/models/contato.dart';
import 'package:crud01/services/contatoService.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ContatoService api = ContatoService();
  List<Contato> contatoList = <Contato>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
            child: FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return contatoList.length > 0
                ? ContatoList(contatos: contatoList)
                : Center(
                    child: Text('No data found, tap plus button to add!',
                        style: Theme.of(context).textTheme.headline6));
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future loadList() {
    Future<List<Contato>> contatosFuturos = api.getContatos();
    contatosFuturos.then((contatoList) {
      setState(() {
        this.contatoList = contatoList;
      });
    });
    return contatosFuturos;
  }

  _navigateToAddScreen(BuildContext context) async {
    /*final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddContatoDataWidget()),
    );*/
  }
}
