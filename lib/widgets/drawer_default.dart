import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/adocao_widget.dart';
import 'package:helpets/view/denuncia_widget.dart';

class DrawerDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/images/cocchi_lindo.png", fit: BoxFit.fill,
                      width: 100, height:100),
                    ),
                  Text('Matheus Cocchi', style: TextStyle(color: Colors.black, fontSize: 25.0),)
                  ],
                ),
              )),
          ListTile(
            title: Text(
              " Adotar",
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
              " Cuidadores",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              " Passeadores",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              " Sair",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
