import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/cuidadores_widget.dart';
import 'package:helpets/view/passeadores_widget.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class ProcurarCuidadorWidget extends StatefulWidget {
  @override
  _ProcurarCuidadorWidgetState createState() => _ProcurarCuidadorWidgetState();
}

class _ProcurarCuidadorWidgetState extends State<ProcurarCuidadorWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
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
                  colors: [Color(0xFFFF1493), Color(0xfffff500)],
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
                    icon: new Icon(Icons.navigate_before),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CuidadoresWidget(),
                        ),
                      );
                    },
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  Text(
                    "Cuidador",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  IconButton(
                    icon: new Icon(Icons.menu),
                    color: Colors.transparent,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pinkAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 1.1,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/cocchi_lindo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    "Cocchi -",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    " Cuidador",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Piraju - SP",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 11,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFFBFBFB),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Text(
                  "Este Perfil está cadastrado como Cuidador, se estiver \n"
                  "interessado(a) pode conversar com ele.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 15,
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFFBFBFB),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Conversar com ele",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: new Icon(
                      Icons.message,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      FlutterOpenWhatsapp.sendSingleMessage("+5514998595670", "HELPETS - Teste de envio de mensagem (Cocchi aqui).");
                    },
                    color: Colors.white,
                    iconSize: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
