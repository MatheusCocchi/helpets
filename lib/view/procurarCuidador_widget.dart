import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/cuidadores_widget.dart';
import 'package:helpets/view/passeadores_widget.dart';

class ProcurarCuidadorWidget extends StatefulWidget {
  @override
  _ProcurarCuidadorWidgetState createState() => _ProcurarCuidadorWidgetState();
}

class _ProcurarCuidadorWidgetState extends State<ProcurarCuidadorWidget> {
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
                    onPressed: (){},
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
          children: <Widget>[],
        ),
      ),
    );
  }
}
