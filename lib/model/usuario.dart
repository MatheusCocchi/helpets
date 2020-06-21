class Usuario {
  int _codigo;
  String _nome;
  String _senha;
  String _email;
  String _endereco;
  int _numero;
  String _cep;
  String _bairro;
  String _cidade;
  String _telefone;
  String _sexo;
  int _idade;
  String _tipo;
  DateTime _datacad;
  int _status;

  int get codigo => _codigo;

  set codigo(int value) {
    _codigo = value;
  }

  String get nome => _nome;

  int get status => _status;

  set status(int value) {
    _status = value;
  }

  DateTime get datacad => _datacad;

  set datacad(DateTime value) {
    _datacad = value;
  }

  String get tipo => _tipo;

  set tipo(String value) {
    _tipo = value;
  }

  int get idade => _idade;

  set idade(int value) {
    _idade = value;
  }

  String get sexo => _sexo;

  set sexo(String value) {
    _sexo = value;
  }

  String get telefone => _telefone;

  set telefone(String value) {
    _telefone = value;
  }

  String get cidade => _cidade;

  set cidade(String value) {
    _cidade = value;
  }

  String get bairro => _bairro;

  set bairro(String value) {
    _bairro = value;
  }

  String get cep => _cep;

  set cep(String value) {
    _cep = value;
  }

  int get numero => _numero;

  set numero(int value) {
    _numero = value;
  }

  String get endereco => _endereco;

  set endereco(String value) {
    _endereco = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  set nome(String value) {
    _nome = value;
  }
}
