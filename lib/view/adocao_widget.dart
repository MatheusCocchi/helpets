import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/widgets/drawer_default.dart';
import 'package:helpets/view/passeadores_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:helpets/view/adotar_widget.dart';

class AdocaoWidget extends StatefulWidget {
  @override
  _AdocaoWidgetState createState() => _AdocaoWidgetState();
}

class _AdocaoWidgetState extends State<AdocaoWidget> {
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
                    iconSize: 40,
                  ),
                  Text(
                    "Adoção",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  IconButton(
                    icon: new Icon(Icons.filter_center_focus),
                    onPressed: () {
                      return Alert(
                          context: context,
                          title: "FILTRO",
                          content: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Distância',
                                ),
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Sexo',
                                ),
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
                    iconSize: 40,
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
            Container(
              margin: EdgeInsets.only(top: 2, bottom: 500, left: 180),
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
                  push(context, PasseadoresWidget());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
