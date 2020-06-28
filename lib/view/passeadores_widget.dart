import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpets/model/usuario.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/passeadores_widget.dart';
import 'package:helpets/widgets/drawer_default.dart';
import 'package:helpets/widgets/text_field_padrao.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:helpets/view/procurarPasseador_widget.dart';
import 'package:http/http.dart' as http;

class PasseadoresWidget extends StatefulWidget {
  @override
  _PasseadoresWidgetState createState() => _PasseadoresWidgetState();
}

class _PasseadoresWidgetState extends State<PasseadoresWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  TextEditingController _controllerCidade;

  String valueIdade = 'Selecione a idade';

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

  Future<List<Usuario>> getPasseadores() async {
    var url = 'http://192.168.0.102:3001/users/passeadores';

    var response = await http.get(url);

    String listJson = response.body;

    List list = json.decode(listJson);

    final lPasseadores = List<Usuario>();

    for (Map map in list) {
      Usuario u = Usuario().toUser(map);
      lPasseadores.add(u);
    }

    print(lPasseadores.length);

    return lPasseadores;

//    http.get(url).then((value) {
//      print(value.body);
//      if (value.body == "") {
//        _showDialog("Lista de passeadores",
//            "Erro ao tentar inserir o usuário, tente novamente.");
//      } else {
//        String jValue = value.body;
//
//      }
//    }).catchError((erro) {
//      print(erro);
//      _showDialog("Lista de passeadores",
//          "Ocorreu um erro inesperado, tente novamente.");
//    });
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
                    "Passeadores",
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
                                  value: valueIdade,
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
                                      valueIdade = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Selecione a idade',
                                    '18 a 24 anos',
                                    '25 a 40 anos',
                                    'Maior que 40 anos',
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
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              radius: BorderRadius.all(Radius.circular(50)),
                              color: Color(0xFFFF1471),
                              onPressed: () {
                                push(context, ProcurarPasseadorWidget());
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



  _body(BuildContext context) {
    Future<List<Usuario>> future = getPasseadores();

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          _showDialog("Lista de passeadores",
              "Erro ao buscar lista de passeadores.");
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Usuario> listPasseadores = snapshot.data;

        return _listPasseadores(listPasseadores);
      },
    );
  }

  _listPasseadores(List<Usuario> passeadores) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: passeadores.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        push(
                            context,
                            ProcurarPasseadorWidget(
                              usuario: passeadores[index],
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
                                  passeadores[index].sexo.startsWith("M")
                                      ? "assets/images/user_default_m.jpg"
                                      : "assets/images/user_default_f.jpg",
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
                                            child:
                                                Text(passeadores[index].nome)),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "Idade:",
                                            style: TextStyle(
                                                color: Color(0xFFFF1471),
                                                fontSize: 15),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text(passeadores[index]
                                                  .idade
                                                  .toString())),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "Cidade:",
                                            style: TextStyle(
                                                color: Color(0xFFFF1471),
                                                fontSize: 15),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text(
                                                  passeadores[index].cidade)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "Sexo:",
                                            style: TextStyle(
                                                color: Color(0xFFFF1471),
                                                fontSize: 15),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(passeadores[index].sexo),
                                          ),
                                        ],
                                      ),
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
