import 'package:flutter/material.dart';
import 'package:helpets/view/cadastroUser_widget.dart';
import 'package:helpets/view/login_widget.dart';

class CadastroAnimalWidget extends StatefulWidget {
  @override
  _CadastroAnimalWidgetState createState() => _CadastroAnimalWidgetState();
}

class _CadastroAnimalWidgetState extends State<CadastroAnimalWidget> {
  TextEditingController _controllerNome;
  TextEditingController _controllerRaca;

  ///método "principal" responsável por construir a tela de login
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  ///Corpo da tela de login
  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height /2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 32),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          // icon: Icon(Icons.email,
                          //color: Colors.grey
                          //),
                          border: InputBorder.none,
                          hintText: 'Nome'),
                      controller: _controllerNome,    
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    margin: EdgeInsets.only(top: 20),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          // icon: Icon(Icons.vpn_key,
                          //color: Colors.grey
                          //),
                          border: InputBorder.none,
                          hintText: 'Raça'),
                      controller: _controllerRaca,    
                    ),
                  ),
                  Spacer(),
                  
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFF7300),
                          Color(0xFFFF1493)
                        ],
                      ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50)
                        ),
                    ),
                      child: FlatButton(
                      child: Text('Salvar'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold  
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                        return LoginWidget();
                      }),
                      );
                      },
                    ),  
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
