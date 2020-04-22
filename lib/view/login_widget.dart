import 'package:flutter/material.dart';

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
      body: _body(context),
    );
  }

  ///Corpo da tela de login
  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _controllerEmail,
            ),
            TextField(
              controller: _controllerSenha,
            ),
            FlatButton(
              child: Text("Entrar"),
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
