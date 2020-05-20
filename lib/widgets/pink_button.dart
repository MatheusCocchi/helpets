import 'package:flutter/material.dart';

class PinkButton extends StatelessWidget {
  String text;
  Function onPressed;

  PinkButton(this.text, this.onPressed);

  /*
  gradient: LinearGradient(
          colors: [Color(0xfffff500), Color(0xFFFF1471)],
        ),
   */

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFF1471),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
