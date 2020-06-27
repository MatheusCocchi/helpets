import 'package:flutter/material.dart';
import 'package:helpets/model/animal.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/adocao_widget.dart';
import 'package:helpets/view/map_widget.dart';
import 'package:helpets/view/passeadores_widget.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class AnimalPerdidoWidget extends StatefulWidget {
  final Animal animal;

  const AnimalPerdidoWidget({Key key, this.animal}): super(key: key);
  
  @override
  _AnimalPerdidoWidgetState createState() => _AnimalPerdidoWidgetState(animal: this.animal);
  

}

class _AnimalPerdidoWidgetState extends State<AnimalPerdidoWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  Animal animal;

  _AnimalPerdidoWidgetState({this.animal});

  final nomeAnimal = 'Snoop - ';
  final racaAnimal = ' Cocker';
  final idadeAnimal = '3 anos de idade';
  final fotoAnimal = ['list2_dog1', 'list2_dog1'];
  final observacoes = 'Esse animal é dócil e foi perdido no bairro jequitibá';

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Perfil',
      style: optionStyle,
    ),
    Text(
      'Index 1: Chat',
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
                          builder: (context) => AdocaoWidget(),
                        ),
                      );
                    },
                    color: Colors.white,
                  ),
                  Text(
                    "Animais Perdidos",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  IconButton(
                    icon: new Icon(Icons.room),
                    color: Colors.transparent,
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
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
                  child: PageView(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/" + fotoAnimal[0] + ".jpg",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/" + fotoAnimal[1] + ".jpg",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    nomeAnimal,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    racaAnimal,
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
                margin: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  idadeAnimal,
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
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  observacoes,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 50,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFF1471),
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Entrar em contato",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    icon: new Icon(Icons.pets),
                    onPressed: () {
                      FlutterOpenWhatsapp.sendSingleMessage("+5514998595670",
                          "HELPETS - Teste de envio de mensagem (Cocchi aqui).");
                    },
                    color: Colors.white,
                    iconSize: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
