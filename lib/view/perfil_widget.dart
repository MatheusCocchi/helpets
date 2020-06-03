import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/adocao_widget.dart';
import 'package:helpets/widgets/pink_button.dart';

import 'cadastroUser_widget.dart';
import 'login_widget.dart';

class PerfilWidget extends StatefulWidget {
  @override
  _PerfilWidgetState createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
  String valueTipo = 'Selecione o tipo de usuário';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _stackGradient(context),
    );
  }

  _stackGradient(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xfffff500), Color(0xFFFF1471)],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(right: 16, left: 16),
              height: MediaQuery.of(context).size.height / 1.2,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 5)]),
              child: _body(context),
            ),
          ),
        ],
      ),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/cocchi_lindo.png",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: _viewDados(),
            ),
          ],
        ),
      ),
    );
  }

  _viewDados() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Text(
            "Perfil",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            "Endereço: Rua Matheus Cocchi",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "Cidade: Piraju",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "Telefone: (14) 99999-9999",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Text(
            "Alterar tipo de usuário:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(top: 4, left: 16, right: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
          child: DropdownButton<String>(
            value: valueTipo,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            isExpanded: true,
            underline: SizedBox(),
            onChanged: (String newValue) {
              setState(() {
                valueTipo = newValue;
              });
            },
            items: <String>[
              'Selecione o tipo de usuário',
              'Passeador',
              'Cuidador',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: PinkButton(
            "Salvar",
            () {
              push(context, LoginWidget());
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 2),
          child: FlatButton(
            child: Text(
              "Apagar conta",
              style: TextStyle(
                color: Color(0xFFFF1471),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              push(context, AdocaoWidget());
            },
          ),
        ),
      ],
    );
  }
}
