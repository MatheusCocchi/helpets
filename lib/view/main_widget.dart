import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpets/model/usuario.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/utils/prefs.dart';
import 'package:helpets/view/adocao_widget.dart';
import 'package:helpets/view/cuidadores_widget.dart';
import 'package:helpets/view/passeadores_widget.dart';
import 'package:helpets/view/perfil_widget.dart';
import 'package:helpets/widgets/drawer_default.dart';
import 'package:helpets/widgets/pink_button.dart';

import 'denuncia_widget.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  final nomeUser = ' Matheus Cocchi';
  String userJson = "";
  Usuario usuario = new Usuario();

    int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Chat',
      style: optionStyle,
    ),
    Text(
      'Index 1: Perfil',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    userJson = Prefs().getUserLogado();

    Map userMap = json.decode(userJson);

    usuario = Usuario().toUser(userMap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: new Size(MediaQuery.of(context).size.width, 100.0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
          ]),
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF1493), Color(0xfffff500)],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    IconButton(
                      icon: new Icon(Icons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Olá,",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              usuario.nome,
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/cocchi_lindo.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pinkAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text('Chat'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: _body(context),
      drawer: DrawerDefault(),
      key: _scaffoldKey,
    );
  }

  ///Corpo da tela da Main
  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _menuInicialItem(
              "assets/images/menu_adotar.jpg",
              "Adotar",
              () {
                push(context, AdocaoWidget());
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: _menuInicialItem(
                "assets/images/menu_passeador.jpg",
                "Passeadores",
                () {
                  push(context, PasseadoresWidget());
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: _menuInicialItem(
                "assets/images/menu_cuidador.png",
                "Cuidadores",
                () {
                  push(context, CuidadoresWidget());
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: _menuInicialItem(
                "assets/images/menu_denuncia.jpg",
                "Denúncia",
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

  _menuInicialItem(String img, String titulo, Function onTap) {
    return ClipRRect(
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          child: Stack(
            children: <Widget>[
              Image.asset(
                img,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SizedBox.expand(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    titulo,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(125, 0, 0, 255),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          onTap: onTap,
        ),
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
