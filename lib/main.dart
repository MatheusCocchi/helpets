import 'package:flutter/material.dart';
import 'package:helpets/utils/prefs.dart';
import 'package:helpets/view/login_widget.dart';
import 'package:helpets/view/main_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Helpets',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: result() ? LoginWidget() : MainWidget(),
    );
  }

  bool result() {
    verificarUserLogado().then((value) {
      return value;
    });
  }

  Future<bool> verificarUserLogado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey('userLogado');
    if (CheckValue) {
      if (Prefs().getUserLogado() != "") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
