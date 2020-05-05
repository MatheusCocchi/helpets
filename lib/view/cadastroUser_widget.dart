import 'package:flutter/material.dart';

class CadastroUserWidget extends StatefulWidget {
  @override
  _CadastroUserWidgetState createState() => _CadastroUserWidgetState();
}

class _CadastroUserWidgetState extends State<CadastroUserWidget> {
  TextEditingController _controllerNome;
  TextEditingController _controllerEndereco;
  TextEditingController _controllerNumero;
  TextEditingController _controllerBairro;

  ///método "principal" responsável por construir a tela de cadastro de usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  ///Corpo da tela de cadastro de usuário
  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _controllerNome,
            ),
            TextField(
              controller: _controllerEndereco,
            ),
            TextField(
              controller: _controllerNumero,
            ),
            TextField(
              controller: _controllerBairro,
            ),
            FlatButton(
              child: Text("Cadastre-se"),
              onPressed: () {

              },
            ),
            FlatButton(
              child: Text("Voltar"),
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
