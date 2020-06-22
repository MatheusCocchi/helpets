import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/widgets/pink_button.dart';
import 'package:helpets/widgets/text_field_padrao.dart';

import 'login_widget.dart';

class RecuperarSenhaWidget extends StatefulWidget {
  @override
  _RecuperarSenhaWidgetState createState() => _RecuperarSenhaWidgetState();
}

class _RecuperarSenhaWidgetState extends State<RecuperarSenhaWidget> {
  TextEditingController _controllerEmail;
  TextEditingController _controllerSenha;
  TextEditingController _controllerConfirmarSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _stackGradient(context),
    );
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
              "Recuperar Senha",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFFF1471),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: TextFieldPadrao(
                "E-mail", _controllerEmail, TextInputType.emailAddress),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: TextFieldPadrao(
                "Nova Senha", _controllerSenha, TextInputType.text),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: TextFieldPadrao("Confirmar nova senha",
                _controllerConfirmarSenha, TextInputType.text),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: PinkButton(
              "Confirmar",
              () {
                push(context, LoginWidget());
              },
            ),
          ),
        ],
      ),
    );
  }
}
