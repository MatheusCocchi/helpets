import 'package:flutter/material.dart';
import 'package:helpets/view/cadastroAnimal_widget.dart';

class CadastroUserWidget extends StatefulWidget {
  @override
  _CadastroUserWidgetState createState() => _CadastroUserWidgetState();
}

class _CadastroUserWidgetState extends State<CadastroUserWidget> {
  TextEditingController _controllerNome;
  TextEditingController _controllerEndereco;
  TextEditingController _controllerNumero;
  TextEditingController _controllerBairro;

  ///método "principal" responsável por construir a tela de cadastro de usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  ///Corpo da tela de cadastro de usuário
  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
                        Container(
              height: MediaQuery.of(context).size.height /1.5,
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
                          hintText: 'Endereço'),
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
                          hintText: 'Numero'),
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
                          hintText: 'Bairro'),
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
                        return CadastroAnimalWidget();
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
