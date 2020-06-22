import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

Future pushReplacement(BuildContext context, Widget page) {
  return Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) {
        return page;
      }));
}

void pop(BuildContext context) {
  return Navigator.pop(context);
}
