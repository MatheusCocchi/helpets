class Usuario {
  int codigo;
  String nome;
  String senha;
  String email;
  String endereco;
  int numero;
  String cep;
  String bairro;
  String cidade;
  String telefone;
  String sexo;
  int idade;
  String tipo;
  DateTime datacad;
  int status;

  Usuario(
      {this.codigo,
      this.nome,
      this.senha,
      this.email,
      this.endereco,
      this.numero,
      this.cep,
      this.bairro,
      this.cidade,
      this.telefone,
      this.sexo,
      this.idade,
      this.tipo,
      this.datacad,
      this.status});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'senha': senha,
      'email': email,
      'endereco': endereco,
      'numero': numero,
      'cep': cep,
      'bairro': bairro,
      'cidade': cidade,
      'telefone': telefone,
      'sexo': sexo,
      'idade': idade,
      'tipo': tipo,
      'datacad': datacad,
      'status': status,
    };
  }

  Usuario toUser(Map<String, dynamic> mapUser) {
    Usuario u = new Usuario(
        codigo: mapUser["codigo"],
        nome: mapUser["nome"],
        senha: mapUser["senha"],
        email: mapUser["email"],
        endereco: mapUser["endereco"],
        numero: mapUser["numero"],
        cep: mapUser["cep"],
        bairro: mapUser["bairro"],
        cidade: mapUser["cidade"],
        telefone: mapUser["telefone"],
        sexo: mapUser["sexo"],
        idade: mapUser["idade"],
        tipo: mapUser["tipo"],
        datacad: mapUser["datacad"],
        status: mapUser["status"]);
  }
}
