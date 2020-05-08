import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/adocao_widget.dart';
import 'package:helpets/widgets/pink_button.dart';

import 'cadastroUser_widget.dart';
import 'login_widget.dart';

class PerfilWidget extends StatefulWidget {
  @override
  _PerfilWidgetState createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
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
            "assets/images/cocchi.jpg",
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Perfil",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "Endereço: Rua Matheus Cocchi",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Cidade: Piraju",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Telefone: (14) 99999-9999",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "Alterar tipo de usuário:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            child: PinkButton(
              "Salvar",
              () {
                push(context, LoginWidget());
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: FlatButton(
              child: Text(
                "Apagar conta",
                style: TextStyle(
                  color: Color(0xFFFF1471),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                push(context, AdocaoWidget());
              },
            ),
          ),
        ],
      ),
    );
  }
}
