import 'package:flutter/material.dart';
import 'package:helpets/view/cadastroUser_widget.dart';

class CadastroAnimalWidget extends StatefulWidget {
  @override
  _CadastroAnimalWidgetState createState() => _CadastroAnimalWidgetState();
}

class _CadastroAnimalWidgetState extends State<CadastroAnimalWidget> {
  TextEditingController _controllerNome;
  TextEditingController _controllerRaca;

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

          ],
        ),
      ),
    );
  }
}
