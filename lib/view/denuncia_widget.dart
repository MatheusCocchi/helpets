import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/perfil_widget.dart';
import 'package:helpets/widgets/pink_button.dart';

class DenunciaWidget extends StatefulWidget {
  @override
  _DenunciaWidgetState createState() => _DenunciaWidgetState();
}

class _DenunciaWidgetState extends State<DenunciaWidget> {
  //TextEditingController _controllerEmail;
  //TextEditingController _controllerSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  ///Corpo da tela denuncia
  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Denúncia",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              width: 400,
              margin: EdgeInsets.only(top: 5),
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/dog_triste.png"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 80, right: 80),
              child: Text(
                "Olá, sabemos que se você procurou este aplicativo é porque gosta muito dos animais, não é mesmo?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 80, right: 80, top: 50),
              child: Text(
                "Então não se esqueça que maus tratos aos animais é crime!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 80, right: 80, top: 50),
              child: Text(
                "Caso saiba de maus tratos denuncie! 0800 61 8080",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
