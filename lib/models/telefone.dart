class Telefone {
  final int idTelefone;
  final String numero;
  final String tipo;
  final String ddd;

  Telefone(
      {required this.idTelefone,
      required this.numero,
      required this.tipo,
      required this.ddd});

  factory Telefone.fromJson(Map<String, dynamic> json) {
    return Telefone(
        idTelefone: json['idContato'] as int,
        numero: json['nome'] as String,
        tipo: json['email'] as String,
        ddd: json['telefonePrincipal'] as String);
  }

  @override
  String toString() {
    return 'Contatos{idTelefone: $idTelefone, numero: $numero, tipo: $tipo, ddd: $ddd}';
  }
}
