import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/widgets/drawer_default.dart';

class ListaAdocaoWidget extends StatefulWidget {
  @override
  _ListaAdocaoWidgetState createState() => _ListaAdocaoWidgetState();
}

class _ListaAdocaoWidgetState extends State<ListaAdocaoWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  final nomeAnimal = ['Daniel', 'Zurdo', 'Cocchi'];
  final idadeAnimal = ['3 anos de idade', '1 ano de idade', '2 anos de idade'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyLista(),
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
                    "Lista de Adoções",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _bodyLista() {

    
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: nomeAnimal.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/cocchi_lindo.png",
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Text(nomeAnimal[index]),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(idadeAnimal[index]),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.chat),
              ),
            ],
          ),
        );
      },
    );
  }

}
