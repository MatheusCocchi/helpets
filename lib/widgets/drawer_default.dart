import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Image.asset(
            "assets/images/ic_helpets_prov.png",
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
