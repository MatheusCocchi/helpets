import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/cadastroUser_widget.dart';
import 'package:helpets/view/main_widget.dart';
import 'package:helpets/view/recuperarSenha_widget.dart';
import 'package:helpets/widgets/pink_button.dart';
import 'package:helpets/widgets/text_field_padrao.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController _controllerEmail;
  TextEditingController _controllerSenha;

  ///método "principal" responsável por construir a tela de login
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _stackGradient(context),
    );
  }

  login(){
    //192.168.1.104
    var test = "matheuscocchi@hotmail.com";
    var test2 = "mc1234";
    var url = 'http://192.168.5.5:3001/users/login?email=' +
        test +
        '&senha=' +
        test2;
    http.get(url).then((value){
      print(value.body);
    }).catchError((erro){
      print(erro);
    });
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
//                login().then((value) {
//                   if (value.statusCode == 200) {
//                       var jsonResponse = convert.jsonDecode(value.body);
//                       print(jsonResponse);
//                   } else {
//                       print("erro: $value");
//                   }
//
//                  //push(context, MainWidget());
//                });
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
