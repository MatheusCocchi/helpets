import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/adocao_widget.dart';
import 'package:helpets/view/cuidadores_widget.dart';
import 'package:helpets/view/denuncia_widget.dart';
import 'package:helpets/view/main_widget.dart';
import 'package:helpets/view/passeadores_widget.dart';

class DrawerDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/cocchi_lindo.png",
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Bem-vindo(a), Matheus Cocchi',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Início",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainWidget(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              "Adotar",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdocaoWidget(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              "Cuidadores",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CuidadoresWidget(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              "Passeadores",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasseadoresWidget(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              "Sair",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
