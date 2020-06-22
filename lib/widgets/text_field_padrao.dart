import 'package:flutter/material.dart';

class TextFieldPadrao extends StatelessWidget {
  String hint;
  TextEditingController _controller;
  TextInputType inputType;

  TextFieldPadrao(this.hint, this._controller, this.inputType);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: hint),
        keyboardType: inputType,
        controller: _controller,
      ),
    );
  }
}
