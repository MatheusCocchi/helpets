import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  addUser(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userLogado', user);
  }

  addStringToSF(String str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', str);
  }

  addIntToSF(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', i);
  }

  addDoubleToSF(double d) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('doubleValue', d);
  }

  addBoolToSF(bool b) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', b);
  }

  getUserLogado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String user = prefs.getString('userLogado');
    return user;
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('stringValue');
    return stringValue;
  }

  getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('boolValue');
    return boolValue;
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt('intValue');
    return intValue;
  }

  getDoubleValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double doubleValue = prefs.getDouble('doubleValue');
    return doubleValue;
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("stringValue");
    //Remove bool
    prefs.remove("boolValue");
    //Remove int
    prefs.remove("intValue");
    //Remove double
    prefs.remove("doubleValue");
  }
}
