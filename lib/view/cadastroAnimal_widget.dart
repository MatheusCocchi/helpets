import 'package:flutter/material.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/cadastroUser_widget.dart';
import 'package:helpets/widgets/combobox_widget.dart';
import 'package:helpets/widgets/pink_button.dart';
import 'package:helpets/widgets/text_field_padrao.dart';
import 'package:helpets/view/perfil_widget.dart';

class CadastroAnimalWidget extends StatefulWidget {
  @override
  _CadastroAnimalWidgetState createState() => _CadastroAnimalWidgetState();
}

class _CadastroAnimalWidgetState extends State<CadastroAnimalWidget> {
  TextEditingController _controllerNomeDoador;
  TextEditingController _controllerNome;
  TextEditingController _controllerRaca;
  TextEditingController _controllerIdade;
  TextEditingController _controllerQualidade;
  TextEditingController _controllerQualidadeDois;
  TextEditingController _controllerQualidadeTres;

  String valueEspecie = 'Selecione a espécie';
  String valuePorte = 'Selecione o porte';
  String valueSexo = 'Selecione o sexo';

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
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(right: 16, left: 16),
              height: MediaQuery.of(context).size.height / 1.1,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              "assets/images/pata.png",
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Cadastrar Animal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFFF1471),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Nome do doador", _controllerNomeDoador),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Nome", _controllerNome),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Raça", _controllerRaca),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: DropdownButton<String>(
                      value: valueEspecie,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          valueEspecie = newValue;
                        });
                      },
                      items: <String>[
                        'Selecione a espécie',
                        'Cachorro',
                        'Gato',
                        'Outra'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: DropdownButton<String>(
                      value: valuePorte,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          valuePorte = newValue;
                        });
                      },
                      items: <String>[
                        'Selecione o porte',
                        'Pequeno',
                        'Médio',
                        'Grande'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: DropdownButton<String>(
                      value: valueSexo,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          valueSexo = newValue;
                        });
                      },
                      items: <String>[
                        'Selecione o sexo',
                        'Macho',
                        'Fêmea',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Idade", _controllerIdade),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Qualidade 1", _controllerQualidade),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Qualidade 2", _controllerQualidadeDois),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Qualidade 3", _controllerQualidadeTres),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: Color(0xFFFF1471),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "Carregar foto",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                 Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: Color(0xFFFF1471),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "Definir localização",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    width: MediaQuery.of(context).size.width,
                    child: PinkButton(
                      "Salvar",
                      () {
                        push(context, PerfilWidget());
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
