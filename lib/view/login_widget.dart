import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/utils/prefs.dart';
import 'package:helpets/view/cadastroUser_widget.dart';
import 'package:helpets/view/main_widget.dart';
import 'package:helpets/view/recuperarSenha_widget.dart';
import 'package:helpets/widgets/pink_button.dart';
import 'package:helpets/widgets/text_field_padrao.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController _controllerEmail;
  TextEditingController _controllerSenha;




  Future<bool> verificarUserLogado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey('userLogado');
    if (CheckValue) {
      if (Prefs().getUserLogado() != "") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    verificarUserLogado().then((value) {
      if(value) {
        push(context, MainWidget());
      }
    });
    super.initState();
  }

  ///método "principal" responsável por construir a tela de login
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

  login() {
    if (_controllerEmail.text.isEmpty || _controllerSenha.text.isEmpty) {
      _showDialog("Login", "Preencha todos os campos!");
    } else {
      var email = _controllerEmail.text;
      var senha = _controllerSenha.text;
      var url = 'http://192.168.5.5:3001/users/login?email=' +
          email +
          '&senha=' +
          senha;
      http.get(url).then((value) {
        print(value.body);
        if (value.body == "" || value.body.contains("Erro")) {
          _showDialog("Login", "Erro de validação, tente novamente.");
        } else {
          Prefs().addUser(value.body);
          push(context, MainWidget());
        }
      }).catchError((erro) {
        print(erro);
        _showDialog("Login", "Ocorreu um erro inesperado, tente novamente.");
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
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(right: 16, left: 16),
              height: MediaQuery.of(context).size.height / 1.2,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 5)]),
              child: _body(context),
            ),
          ),
        ],
      ),
    );
  }

  ///Corpo da tela de login
  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            "assets/images/ic_helpets_prov.png",
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFFF1471),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: TextFieldPadrao("E-mail", _controllerEmail),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: TextFieldPadrao("Senha", _controllerSenha),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: FlatButton(
              child: Text(
                "Esqueceu a senha?",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onPressed: () {
                push(context, RecuperarSenhaWidget());
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: PinkButton(
              "Entrar",
              () {
                login();
                //FlutterOpenWhatsapp.sendSingleMessage("+5514996810388", "HELPETS - Teste de envio de mensagem (Cocchi aqui).");
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: FlatButton(
              child: Text(
                "Criar conta",
                style: TextStyle(
                  color: Color(0xFFFF1471),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                push(context, CadastroUserWidget());
              },
            ),
          )
        ],
      ),
    );
  }
}
