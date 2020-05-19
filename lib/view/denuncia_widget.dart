import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/perfil_widget.dart';
import 'package:helpets/widgets/drawer_default.dart';
import 'package:helpets/widgets/pink_button.dart';

class DenunciaWidget extends StatefulWidget {
  @override
  _DenunciaWidgetState createState() => _DenunciaWidgetState();
}

class _DenunciaWidgetState extends State<DenunciaWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      drawer: DrawerDefault(),
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
          ]),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xfffff500), Color(0xFFFF1493)],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: new Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  Text(
                    "Denúncia",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                 Icon(
                    Icons.filter_center_focus,
                    color: Colors.transparent,
                    size: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
