import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpets/model/usuario.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/utils/prefs.dart';
import 'package:helpets/view/adocao_widget.dart';
import 'package:helpets/view/cuidadores_widget.dart';
import 'package:helpets/view/denuncia_widget.dart';
import 'package:helpets/view/login_widget.dart';
import 'package:helpets/view/main_widget.dart';
import 'package:helpets/view/passeadores_widget.dart';
import 'package:helpets/view/listaAdocao_widget.dart';
import 'package:helpets/view/perfil_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerDefault extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DrawerDefault> {
  var nomeUser = '';
  var sexoUser = '';
  String userJson = "";
  Usuario usuario;

  Future<String> getUserLogado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String a = prefs.getString('userLogado');
    return a;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserLogado().then((value) {
      userJson = value;
      Map userMap = json.decode(userJson.toString());

      usuario = Usuario().toUser(userMap);
      nomeUser = usuario.nome;
      sexoUser = usuario.sexo;
      setState(() {});
    });
  }

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
                      sexoUser.startsWith("M")
                          ? "assets/images/user_default_m.jpg"
                          : "assets/images/user_default_f.jpg",
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      nomeUser,
                      style: TextStyle(color: Colors.black, fontSize: 12),
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
              "Perfil",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PerfilWidget(),
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
              "Lista Adoção",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaAdocaoWidget(),
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
              Prefs().removeValues();
              pushReplacement(context, LoginWidget());
            },
          ),
        ],
      ),
    );
  }
}
