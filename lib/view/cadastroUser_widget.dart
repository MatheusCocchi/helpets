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
              decoration: 
              InputDecoration(
              hintText: 'Nome',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
              )),
            ),
            TextField(
              controller: _controllerEndereco,
              decoration: 
              InputDecoration(
              hintText: 'Endereço',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
              )),
            ),
            TextField(
              controller: _controllerNumero,
              decoration: 
              InputDecoration(
              hintText: 'Número',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
              )),
            ),
            TextField(
              controller: _controllerBairro,
              decoration: 
              InputDecoration(
              hintText: 'Bairro',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
              )),
            ),
            FlatButton(
              child: Text("Cadastre-se"),
              shape: 
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                side: BorderSide(color: Colors.deepPurple),
              ),
              color: Colors.deepPurple,
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
