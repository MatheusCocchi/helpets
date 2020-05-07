import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/cadastroUser_widget.dart';
import 'package:helpets/widgets/pink_button.dart';
import 'package:helpets/widgets/text_field_padrao.dart';

class CadastroAnimalWidget extends StatefulWidget {
  @override
  _CadastroAnimalWidgetState createState() => _CadastroAnimalWidgetState();
}

class _CadastroAnimalWidgetState extends State<CadastroAnimalWidget> {
  TextEditingController _controllerNome;
  TextEditingController _controllerRaca;

  ///método "principal" responsável por construir a tela cadastro de animal
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

  ///Corpo da tela de cadastro de animal
  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 32),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Nome", _controllerNome),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Raça", _controllerRaca),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF7300), Color(0xFFFF1493)],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: PinkButton(
                      "Salvar",
                      () {
                        push(context, CadastroUserWidget());
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
