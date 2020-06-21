import 'usuario.dart';

class Animal {
  int _codigo;
  String _nome;
  String _especie;
  String _porte;
  String _raca;
  String _sexo;
  String _qualidade1;
  String _qualidade2;
  String _qualidade3;
  String _observacao;
  int _idade;
  List<int> _foto1;
  List<int> _foto2;
  List<int> _foto3;
  String _latitude;
  String _longitude;
  int _status;
  DateTime _datacad;
  String _tipo;
  Usuario _codusuario;

  int get codigo => _codigo;

  set codigo(int value) {
    _codigo = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  Usuario get codusuario => _codusuario;

  set codusuario(Usuario value) {
    _codusuario = value;
  }

  String get tipo => _tipo;

  set tipo(String value) {
    _tipo = value;
  }

  DateTime get datacad => _datacad;

  set datacad(DateTime value) {
    _datacad = value;
  }

  int get status => _status;

  set status(int value) {
    _status = value;
  }

  String get longitude => _longitude;

  set longitude(String value) {
    _longitude = value;
  }

  String get latitude => _latitude;

  set latitude(String value) {
    _latitude = value;
  }

  List<int> get foto3 => _foto3;

  set foto3(List<int> value) {
    _foto3 = value;
  }

  List<int> get foto2 => _foto2;

  set foto2(List<int> value) {
    _foto2 = value;
  }

  List<int> get foto1 => _foto1;

  set foto1(List<int> value) {
    _foto1 = value;
  }

  int get idade => _idade;

  set idade(int value) {
    _idade = value;
  }

  String get observacao => _observacao;

  set observacao(String value) {
    _observacao = value;
  }

  String get qualidade3 => _qualidade3;

  set qualidade3(String value) {
    _qualidade3 = value;
  }

  String get qualidade2 => _qualidade2;

  set qualidade2(String value) {
    _qualidade2 = value;
  }

  String get qualidade1 => _qualidade1;

  set qualidade1(String value) {
    _qualidade1 = value;
  }

  String get sexo => _sexo;

  set sexo(String value) {
    _sexo = value;
  }

  String get raca => _raca;

  set raca(String value) {
    _raca = value;
  }

  String get porte => _porte;

  set porte(String value) {
    _porte = value;
  }

  String get especie => _especie;

  set especie(String value) {
    _especie = value;
  }
}
