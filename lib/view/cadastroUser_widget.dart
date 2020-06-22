import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpets/model/usuario.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/utils/prefs.dart';
import 'package:helpets/view/cadastroAnimal_widget.dart';
import 'package:helpets/widgets/pink_button.dart';
import 'package:helpets/widgets/text_field_padrao.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CadastroUserWidget extends StatefulWidget {
  @override
  _CadastroUserWidgetState createState() => _CadastroUserWidgetState();
}

class _CadastroUserWidgetState extends State<CadastroUserWidget> {
  TextEditingController _controllerNome = new TextEditingController();
  TextEditingController _controllerEndereco = new TextEditingController();
  TextEditingController _controllerNumero = new TextEditingController();
  TextEditingController _controllerBairro = new TextEditingController();
  TextEditingController _controllerCep = new TextEditingController();
  TextEditingController _controllerCidade = new TextEditingController();
  TextEditingController _controllerIdade = new TextEditingController();
  TextEditingController _controllerTelefone = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerSenha = new TextEditingController();

  String valueSexo = 'Selecione o sexo';
  String valueTipo = 'Selecione o tipo de usuário';

  String userJson = "";
  Usuario user = new Usuario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Intl.defaultLocale = 'pt_BR';
  }

  ///método "principal" responsável por construir a tela de cadastro de usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _stackGradient(context),
    );
  }

  void _showDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(msg),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  inserirUsuario() {
    if (_controllerEmail.text.toString().isEmpty ||
        _controllerSenha.text.toString().isEmpty) {
      _showDialog("Cadastro de Usuário", "Preencha todos os campos!");
    } else {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      user.nome = _controllerNome.text.toString();
      user.email = _controllerEmail.text.toString();
      user.senha = _controllerSenha.text.toString();
      user.endereco = _controllerEndereco.text.toString();
      user.numero = int.parse(_controllerNumero.text.toString());
      user.cep = _controllerCep.text.toString();
      user.bairro = _controllerBairro.text.toString();
      user.cidade = _controllerCidade.text.toString();
      user.telefone = "55" + _controllerTelefone.text.toString();
      user.sexo = valueSexo;
      user.idade = int.parse(_controllerIdade.text.toString());
      user.tipo = valueTipo;
      user.datacad = formattedDate;
      user.status = 1;

      Map userMap = user.toMap();

      userJson = json.encode(userMap);

      print(userJson);

      var url = 'http://192.168.5.10:3001/users/inUser?jUsuario=' + userJson;
      http.get(url).then((value) {
        print(value.body);
        if (value.body == "") {
          _showDialog("Cadastro de Usuário",
              "Erro ao tentar inserir o usuário, tente novamente.");
        } else {
          String jValue = value.body;
          Map mapValue = json.decode(jValue.toString());
          if (mapValue["success"]) {
            _showDialog("Cadastro de Usuário", "Usuário inserido com sucesso!");
          } else {
            _showDialog("Cadastro de Usuário",
                "Erro ao tentar inserir o usuário, tente novamente.");
          }
        }
      }).catchError((erro) {
        print(erro);
        _showDialog("Cadastro de Usuário",
            "Ocorreu um erro inesperado, tente novamente.");
      });
    }
  }

  _stackGradient(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xfffff500), Color(0xFFFF1471)],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(right: 16, left: 16),
              height: MediaQuery.of(context).size.height / 1.1,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 5)]),
              child: _body(context),
            ),
          ),
        ],
      ),
    );
  }

  ///Corpo da tela de cadastro de usuário
  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              "assets/images/user.png",
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Cadastro de Usuário",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFFF1471),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 32),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Nome", _controllerNome, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Endereço", _controllerEndereco, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Número", _controllerNumero, TextInputType.number),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Bairro", _controllerBairro, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "CEP", _controllerCep, TextInputType.number),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Cidade", _controllerCidade, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: DropdownButton<String>(
                      value: valueSexo,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.black54,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          valueSexo = newValue;
                        });
                      },
                      items: <String>[
                        'Selecione o sexo',
                        'Masculino',
                        'Feminino',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black54),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Data de Nascimento",
                        _controllerIdade, TextInputType.number),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Telefone", _controllerTelefone, TextInputType.phone),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Email", _controllerEmail, TextInputType.emailAddress),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Senha", _controllerSenha, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: DropdownButton<String>(
                      value: valueTipo,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.black54,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          valueTipo = newValue;
                        });
                      },
                      items: <String>[
                        'Selecione o tipo de usuário',
                        'Comum',
                        'Passeador',
                        'Cuidador',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black54),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: Color(0xFFFF1471),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "Carregar foto",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF7300), Color(0xFFFF1493)],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: PinkButton(
                      "Salvar",
                      () {
                        inserirUsuario();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
