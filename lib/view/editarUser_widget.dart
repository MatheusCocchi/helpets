import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpets/model/usuario.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/utils/prefs.dart';
import 'package:helpets/widgets/obscure_tf_padrao.dart';
import 'package:helpets/widgets/pink_button.dart';
import 'package:helpets/widgets/text_field_padrao.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditarUserWidget extends StatefulWidget {
  @override
  _EditarUserWidgetState createState() => _EditarUserWidgetState();
}

class _EditarUserWidgetState extends State<EditarUserWidget> {
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
  TextEditingController _controllerNovaSenha = new TextEditingController();
  TextEditingController _controllerConfirmSenha = new TextEditingController();

  String valueSexo = 'Selecione o sexo';
  String valueTipo = 'Selecione o tipo de usuário';

  String userJson = "";
  Usuario user;

  int codigoUser = 0;
  int statusUser = 0;
  String senhaUser = '';
  String dataCadUser = '';

  Future<String> getUserLogado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String a = prefs.getString('userLogado');
    //print("MATHEUS - " + a);
    return a;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Intl.defaultLocale = 'pt_BR';

    getUserLogado().then((value) {
      userJson = value;
      Map userMap = json.decode(userJson.toString());

      user = Usuario().toUser(userMap);
      _controllerNome.text = user.nome;
      _controllerEndereco.text = user.endereco;
      _controllerNumero.text = user.numero.toString();
      _controllerBairro.text = user.bairro;
      _controllerCep.text = user.cep;
      _controllerCidade.text = user.cidade;
      _controllerIdade.text = user.idade.toString();
      _controllerTelefone.text = user.telefone;
      _controllerEmail.text = user.email;
      valueSexo = user.sexo;
      valueTipo = user.tipo;
      setState(() {});
    });
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

  void _showDialogSuccess(String title, String msg) {
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
                _controllerNome.clear();
                _controllerEndereco.clear();
                _controllerNumero.clear();
                _controllerBairro.clear();
                _controllerCep.clear();
                _controllerCidade.clear();
                _controllerEmail.clear();
                _controllerSenha.clear();
                _controllerTelefone.clear();
                _controllerIdade.clear();
                _controllerNovaSenha.clear();
                _controllerConfirmSenha.clear();
                valueSexo = 'Selecione o sexo';
                valueTipo = 'Selecione o tipo de usuário';
                pop(context);
                setState(() {});
                pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  editarDados() {
    if (_controllerNome.text.toString().isEmpty ||
        _controllerEndereco.text.toString().isEmpty ||
        _controllerNumero.text.toString().isEmpty ||
        _controllerBairro.text.toString().isEmpty ||
        _controllerCep.text.toString().isEmpty ||
        _controllerIdade.text.toString().isEmpty ||
        _controllerCidade.text.toString().isEmpty ||
        _controllerTelefone.text.toString().isEmpty ||
        _controllerEmail.text.toString().isEmpty ||
        valueSexo == "Selecione o sexo" ||
        valueTipo == "Selecione o tipo de usuário" ||
        (_controllerNovaSenha.text.toString().isNotEmpty &&
            _controllerConfirmSenha.text.toString().isEmpty)) {
      _showDialog("Editar dados", "Preencha todos os campos!");
    } else if (int.parse(_controllerIdade.text.toString()) < 16) {
      _showDialog("Editar dados",
          "Apenas pessoas com 16 anos ou mais podem realizar o cadastro em Helpets!!");
    } else if (_controllerNovaSenha.text.toString().isNotEmpty &&
        (_controllerSenha.text.toString() != user.senha)) {
      _showDialog("Editar dados",
          "Senha informada não corresponde com nossa base de dados!");
    } else if (_controllerNovaSenha.text.toString().isNotEmpty &&
        (_controllerNovaSenha.text.toString() !=
            _controllerConfirmSenha.text.toString())) {
      _showDialog("Editar dados", "Erro ao confirmar nova senha.");
    } else {
//      DateTime now = DateTime.now();
//      String formattedDate = DateFormat.yMMMd().format(now);

      String formattedDate = '2020-06-24';

      String senha = '';
      if (_controllerNovaSenha.text.toString().isNotEmpty)
        senha = _controllerNovaSenha.text.toString();
      else
        senha = user.senha;

      user.nome = _controllerNome.text.toString();
      user.email = _controllerEmail.text.toString();
      user.senha = senha;
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

      Map userMap = user.toMapWithCod();

      userJson = json.encode(userMap);

      print(userJson);

      var url = 'http://192.168.5.13:3001/users/upUser?jUsuario=' + userJson;
      http.get(url).then((value) {
        print(value.body);
        if (value.body == "") {
          _showDialog("Editar dados",
              "Erro ao tentar editar os dados, tente novamente.");
        } else {
          String jValue = value.body;
          Map mapValue = json.decode(jValue.toString());
          if (mapValue["success"]) {
            _showDialogSuccess("Editar dados", "Dados editados com sucesso!");

            Prefs().addUser(userJson);
          } else {
            _showDialog("Editar dados",
                "Erro ao tentar editar os dados, tente novamente.");
          }
        }
      }).catchError((erro) {
        print(erro);
        _showDialog(
            "Editar dados", "Erro ao tentar editar os dados, tente novamente.");
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
                "Editar dados",
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
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider()),
                  Container(
                    child: ObscureTextFieldPadrao("Digite sua sennha",
                        _controllerSenha, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: ObscureTextFieldPadrao("Digite a nova sennha",
                        _controllerNovaSenha, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: ObscureTextFieldPadrao("Confirme a nova sennha",
                        _controllerConfirmSenha, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
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
                        editarDados();
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
