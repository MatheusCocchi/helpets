import 'package:flutter/material.dart';

class AdocaoWidget extends StatefulWidget {
  @override
  _AdocaoWidgetState createState() => _AdocaoWidgetState();
}

class _AdocaoWidgetState extends State<AdocaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Adoção",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              height: 500,
              width: 380,
              child: PageView(
                children: <Widget>[
                  Image.asset("assets/images/doguinho.png", fit: BoxFit.cover),
                  Image.asset("assets/images/dog_sorriso.png",
                      fit: BoxFit.cover),
                  Image.asset("assets/images/dog_feliz.png", fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
