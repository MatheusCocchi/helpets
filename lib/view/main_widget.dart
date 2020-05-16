import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/perfil_widget.dart';
import 'package:helpets/widgets/drawer_default.dart';
import 'package:helpets/widgets/pink_button.dart';

import 'denuncia_widget.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  //TextEditingController _controllerEmail;
  //TextEditingController _controllerSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      drawer: DrawerDefault(),
    );
  }

  ///Corpo da tela da Main
  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfffff500), Color(0xFFFF1493)],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
            ClipRRect(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 130,
              width: 350,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(90),
              ),
              ),
              child: FlatButton(
                onPressed: () {},
                child: Image.asset(
                  'assets/images/dog_triste.png',
                  width: 350,
                  height: 130,
                  fit: BoxFit.fitWidth,
                ),
             
              ),
            ),
            borderRadius: BorderRadius.circular(90),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 50,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF7300), Color(0xFFFF1493)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: PinkButton(
                "Navegar p/ denuncia",
                () {
                  push(context, DenunciaWidget());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
