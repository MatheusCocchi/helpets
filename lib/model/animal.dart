import 'usuario.dart';

class Animal {
  int codigo;
  String nome;
  String especie;
  String porte;
  String raca;
  String sexo;
  String qualidade1;
  String qualidade2;
  String qualidade3;
  String observacao;
  int idade;
  List<int> foto1;
  List<int> foto2;
  List<int> foto3;
  String latitude;
  String longitude;
  int status;
  String datacad;
  String tipo;
  Usuario codusuario;

  Animal(
      {this.codigo,
      this.nome,
      this.especie,
      this.porte,
      this.raca,
      this.sexo,
      this.qualidade1,
      this.qualidade2,
      this.qualidade3,
      this.observacao,
      this.idade,
      this.foto1,
      this.foto2,
      this.foto3,
      this.latitude,
      this.longitude,
      this.status,
      this.datacad,
      this.tipo,
      this.codusuario});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'especie': especie,
      'porte': porte,
      'raca': raca,
      'sexo': sexo,
      'qualidade1': qualidade1,
      'qualidade2': qualidade2,
      'qualidade3': qualidade3,
      'observacao': observacao,
      'idade': idade,
      'foto1': foto1,
      'foto2': foto2,
      'foto3': foto3,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      'datacad': datacad,
      'tipo': tipo,
      'codusuario': codusuario,
    };
  }

  Animal toAnimal(Map<String, dynamic> mapAnimal) {
    Animal a = new Animal(
        codigo: mapAnimal["codigo"],
        nome: mapAnimal["nome"],
        especie: mapAnimal["especie"],
        porte: mapAnimal["porte"],
        raca: mapAnimal["raca"],
        sexo: mapAnimal["sexo"],
        qualidade1: mapAnimal["qualidade1"],
        qualidade2: mapAnimal["qualidade2"],
        qualidade3: mapAnimal["qualidade3"],
        observacao: mapAnimal["observacao"],
        idade: mapAnimal["idade"],
        foto1: mapAnimal["foto1"],
        foto2: mapAnimal["foto2"],
        foto3: mapAnimal["foto3"],
        latitude: mapAnimal["latitude"],
        longitude: mapAnimal["longitude"],
        status: mapAnimal["status"],
        datacad: mapAnimal["datacad"],
        tipo: mapAnimal["tipo"],
        codusuario: mapAnimal["codusuario"]);
    return a;
  }
}
