import 'package:flutter/material.dart';

class TextFieldPadrao extends StatelessWidget {
  String hint;
  TextEditingController _controller;

  TextFieldPadrao(this.hint, this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 50,
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: hint),
        controller: _controller,
      ),
    );
  }
}
