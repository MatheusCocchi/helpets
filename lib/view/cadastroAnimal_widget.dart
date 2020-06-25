import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:helpets/model/animal.dart';
import 'package:helpets/model/usuario.dart';
import 'package:helpets/utils/nav.dart';
import 'package:helpets/view/cadastroUser_widget.dart';
import 'package:helpets/view/map_widget.dart';
import 'package:helpets/widgets/combobox_widget.dart';
import 'package:helpets/widgets/pink_button.dart';
import 'package:helpets/widgets/text_field_padrao.dart';
import 'package:helpets/view/perfil_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CadastroAnimalWidget extends StatefulWidget {
  @override
  _CadastroAnimalWidgetState createState() => _CadastroAnimalWidgetState();
}

class _CadastroAnimalWidgetState extends State<CadastroAnimalWidget> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  TextEditingController _controllerNome = new TextEditingController();
  TextEditingController _controllerRaca = new TextEditingController();
  TextEditingController _controllerIdade = new TextEditingController();
  TextEditingController _controllerQualidade = new TextEditingController();
  TextEditingController _controllerQualidadeDois = new TextEditingController();
  TextEditingController _controllerQualidadeTres = new TextEditingController();
  TextEditingController _controllerObservacoes = new TextEditingController();

  String valueEspecie = 'Selecione a espécie';
  String valuePorte = 'Selecione o porte';
  String valueSexo = 'Selecione o sexo';
  String valueTipo = 'Selecione o tipo de cadastro';

  File _imageUm;
  File _imageDois;
  File _imageTres;

  String animalJson = "";
  Animal animal = new Animal();

  String userJson = "";
  Usuario usuario;

  Future<String> getUserLogado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Return string
    String a = prefs.getString('userLogado');
    return a;
  }

  Position _position;
  StreamSubscription<Position> _positionStream;
  String _latitude, _longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Intl.defaultLocale = 'pt_BR';

    getUserLogado().then((value) {
      userJson = value;
      Map userMap = json.decode(userJson.toString());

      usuario = Usuario().toUser(userMap);

      animal.codusuario = usuario;

      setState(() {});
    });
  }

  // final picker = ImagePicker();

  Future getImageUmFromGallery() async {
    //final pickedImage = await picker.getImage(source: ImageSource.gallery);
    var pickedImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      //print(pickedImage);
      this._imageUm = pickedImage;
    });
  }

  Future getImageDoisFromGallery() async {
    var pickedImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      this._imageDois = pickedImage;
    });
  }

  Future getImageTresFromGallery() async {
    var pickedImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      this._imageTres = pickedImage;
    });
  }

  // Converte pra base64
  String base64Image;
  List<int> imageBytes;
  var imageUm, imageDois, imageTres;

  void convertImage() {
    imageBytes = _imageUm.readAsBytesSync();
    base64Image = base64Encode(imageBytes);

    imageBytes = _imageDois.readAsBytesSync();
    base64Image = base64Encode(imageBytes);

    imageBytes = _imageTres.readAsBytesSync();
    base64Image = base64Encode(imageBytes);
    print(base64Image);
  }

  // Tentar exibir
  void decodeImage() {
    imageUm = base64Decode(base64Image.toString());
    imageDois = base64Decode(base64Image.toString());
    imageTres = base64Decode(base64Image.toString());
  }

  /* Converte pra Bitmap 
   void decodeImage(){
     final decodedBytes = base64Decode(base64Image);
     print(decodedBytes);
   }*/

// Pega a latitude e longitude e converte para string
  _getLocalization() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _position = position;
      });
    }).catchError((e) {
      print(e);
    });

    _latitude = _position.latitude.toString();
    _longitude = _position.longitude.toString();

    print(_latitude);
    print(_longitude);
  }

  void _showDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(msg),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  inserirAnimal() {
    if (_controllerNome.text.toString().isEmpty ||
        _controllerRaca.text.toString().isEmpty ||
        _controllerIdade.text.toString().isEmpty ||
        _controllerQualidade.text.toString().isEmpty ||
        _controllerQualidadeDois.text.toString().isEmpty ||
        _controllerQualidadeTres.text.toString().isEmpty ||
        _controllerObservacoes.text.toString().isEmpty ||
        valueSexo == "Selecione o sexo" ||
        valueEspecie == "Selecione a espécie" ||
        valuePorte == "Selecione o porte" ||
        valueTipo == "Selecione o tipo de cadastro") {
      _showDialog("Cadastro de Animal", "Preencha todos os campos!");
    } else {
      // DateTime now = DateTime.now();
      //  String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      String formattedDate = '2020-06-24';

      animal.nome = _controllerNome.text.toString();
      animal.raca = _controllerRaca.text.toString();
      animal.idade = int.parse(_controllerIdade.text.toString());
      animal.qualidade1 = _controllerQualidade.text.toString();
      animal.qualidade2 = _controllerQualidadeDois.text.toString();
      animal.qualidade3 = _controllerQualidadeTres.text.toString();
      animal.observacao = _controllerObservacoes.text.toString();
      animal.sexo = valueSexo;
      animal.tipo = valueTipo;
      animal.porte = valuePorte;
      animal.especie = valueEspecie;
      animal.status = 1;
      animal.foto1 = imageUm;
      animal.foto2 = imageDois;
      animal.foto3 = imageTres;
      animal.datacad = formattedDate;
      animal.latitude = _latitude;
      animal.longitude = _longitude;
      animal.status = 1;

      Map animalMap = animal.toMap();

      animalJson = json.encode(animalMap);

      print(animalJson);

      var url =
          'http://192.168.0.101:3001/animal/inAnimal?jAnimal=' + animalJson;
      http.get(url).then((value) {
        print(value.body);
        if (value.body == "") {
          _showDialog("Cadastro de Animal",
              "Erro ao tentar inserir o animal, tente novamente.");
        } else {
          String jValue = value.body;
          Map mapValue = json.decode(jValue.toString());
          if (mapValue["success"]) {
            _showDialog("Cadastro de Animal", "Animal inserido com sucesso!");
            _controllerNome.clear();
            _controllerRaca.clear();
            _controllerQualidade.clear();
            _controllerQualidadeDois.clear();
            _controllerQualidadeTres.clear();
            _controllerObservacoes.clear();
            _controllerIdade.clear();
            valueSexo = 'Selecione o sexo';
            valueTipo = 'Selecione o tipo de cadastro';
            valuePorte = 'Selecione o porte';
            valueEspecie = 'Selecione a espécie';
            pop(context);
          } else {
            _showDialog("Cadastro de Usuário",
                "Erro ao tentar inserir o usuário, tente novamente.");
          }
        }
      }).catchError((erro) {
        print(erro);
        _showDialog("Cadastro de Animal",
            "Ocorreu um erro inesperado, tente novamente.");
      });
    }
  }

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
                        "Nome", _controllerNome, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Raça", _controllerRaca, TextInputType.text),
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
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.black54,
                      ),
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
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black54),
                          ),
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
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.black54,
                      ),
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
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black54),
                          ),
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
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.black54,
                      ),
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
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black54),
                          ),
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
                      value: valueTipo,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.black54,
                      ),
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
                        'Selecione o tipo de cadastro',
                        'Adotar',
                        'Perdido',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black54),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao(
                        "Idade", _controllerIdade, TextInputType.number),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Qualidade 1", _controllerQualidade,
                        TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Qualidade 2",
                        _controllerQualidadeDois, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Qualidade 3",
                        _controllerQualidadeTres, TextInputType.text),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: TextFieldPadrao("Observações",
                        _controllerObservacoes, TextInputType.text),
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
                          onPressed: () {
                            getImageUmFromGallery();
                          },
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
                            "Carregar foto",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {
                            getImageDoisFromGallery();
                          },
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
                            "Carregar foto",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {
                            getImageTresFromGallery();
                          },
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
                          onPressed: () {
                            //push(context, MapWidget());
                            _getLocalization();
                          },
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
                        // push(context, PerfilWidget());
                        inserirAnimal();
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
