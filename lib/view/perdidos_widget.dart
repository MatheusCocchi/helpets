import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpets/model/animal.dart';
import 'package:helpets/model/usuario.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/animalPerdido_widget.dart';
import 'package:helpets/widgets/drawer_default.dart';
import 'package:helpets/view/passeadores_widget.dart';
import 'package:helpets/widgets/text_field_padrao.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:helpets/view/adotar_widget.dart';

import 'package:http/http.dart' as http;

import 'cadastroAnimal_widget.dart';

class PerdidosWidget extends StatefulWidget {
  @override
  _PerdidosWidget createState() => _PerdidosWidget();
}

class _PerdidosWidget extends State<PerdidosWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  TextEditingController _controllerCidade;
  TextEditingController _controllerRaca;

  String valueSexo = 'Selecione o sexo';
  String valuePorte = 'Selecione o porte';

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

  Future<List<Animal>> getAnimaisPerdidos() async {
    var url = 'http://192.168.0.102:3001/animal/perdidos';

    var response = await http.get(url);

    String listJson = response.body;

    List list = json.decode(listJson);

    final lPerdidos = List<Animal>();



    for (Map map in list) {
      Animal a = Animal().toAnimal(map);

      Usuario usu = Usuario().toUser(map["codusuario"]);

      a.codusuario = usu;

      lPerdidos.add(a);
    }


    print(lPerdidos.length.toString() + "COCCHI");

    return lPerdidos;
  }

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
                    icon: new Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    color: Colors.white,
                  ),
                  Text(
                    "Animais Perdidos",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  IconButton(
                    icon: new Icon(Icons.filter_center_focus),
                    onPressed: () {
                      return Alert(
                          context: context,
                          title: "FILTRO",
                          content: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: TextFieldPadrao("Cidade",
                                    _controllerCidade, TextInputType.text),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.only(
                                    top: 4, left: 16, right: 16, bottom: 4),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12, blurRadius: 5)
                                    ]),
                                child: DropdownButton<String>(
                                  value: valueSexo,
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.black54,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      valueSexo = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Selecione o sexo',
                                    'Macho',
                                    'Fêmea',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.only(
                                    top: 4, left: 16, right: 16, bottom: 4),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12, blurRadius: 5)
                                    ]),
                                child: DropdownButton<String>(
                                  value: valuePorte,
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.black54,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      valuePorte = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Selecione o porte',
                                    'Pequeno',
                                    'Médio',
                                    'Grande',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: TextFieldPadrao("Raça", _controllerRaca,
                                    TextInputType.text),
                              ),
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              radius: BorderRadius.all(Radius.circular(50)),
                              color: Color(0xFFFF1471),
                              onPressed: () {
                                push(context, AdotarWidget());
                              },
                              child: Text(
                                "CONFIRMAR",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ]).show();
                    },
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(msg),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _body(BuildContext context) {
    Future<List<Animal>> future = getAnimaisPerdidos();

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          _showDialog("Lista de animais perdidos",
              "Erro ao buscar lista de animais perdidos.");
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Animal> listAnimaisPerdidos = snapshot.data;

        return _listPerdidos(listAnimaisPerdidos);
      },
    );
  }

  _listPerdidos(List<Animal> animaisPerdidos) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, left: 180),
              width: MediaQuery.of(context).size.width / 1.2,
              height: 60,
              decoration: BoxDecoration(
                  color: Color(0xFFFF1471),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: FlatButton(
                child: Text(
                  "+ Cadastrar Animal",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  push(context, AnimalPerdidoWidget());
                },
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: animaisPerdidos.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        push(
                            context,
                            AnimalPerdidoWidget(
                              animal: animaisPerdidos[index],
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 10)
                            ]),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/images/gato_perdido_1.jpg",
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Nome:",
                                          style: TextStyle(
                                              color: Color(0xFFFF1471),
                                              fontSize: 15),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                                animaisPerdidos[index].nome)),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Porte:",
                                          style: TextStyle(
                                              color: Color(0xFFFF1471),
                                              fontSize: 15),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                                animaisPerdidos[index].porte)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Observação:",
                                          style: TextStyle(
                                              color: Color(0xFFFF1471),
                                              fontSize: 15),
                                        ),
                                        Container(
                                            child: Text(
                                          animaisPerdidos[index].observacao,
                                          maxLines: 2,
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
