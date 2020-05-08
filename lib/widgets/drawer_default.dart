import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          FlutterLogo(
            size: 50,
          ),
        ],
      ),
    );
  }
}
