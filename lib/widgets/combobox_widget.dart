import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "Dropdown especie";

  @override
  DropDownState createState() => DropDownState();
}

class Especie {
  int id;
  String name;

  Especie(this.id, this.name);

  static List<Especie> getEspecie() {
    return <Especie>[
      Especie(1, 'Gato'),
      Especie(2, 'Cachorro'),
    ];
  }
}

class DropDownState extends State<DropDown> {
  List<Especie> _especie = Especie.getEspecie();
  List<DropdownMenuItem<Especie>> _dropdownMenuItems;
  Especie _selectedEspecie;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_especie);
    _selectedEspecie = _dropdownMenuItems[0].value;

    super.initState();
  }

  List<DropdownMenuItem<Especie>> buildDropdownMenuItems(List especies) {
    List<DropdownMenuItem<Especie>> items = List();
    for (Especie especie in especies) {
      items.add(
        DropdownMenuItem(
          value: especie,
          child: Text(especie.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Especie selectedEspecie){
    setState(() {
      _selectedEspecie = selectedEspecie;
    });
  }
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
      child: Column(
        children: <Widget>[
          DropdownButton(
            itemHeight: 50,
            value: _selectedEspecie,
            items: _dropdownMenuItems,
            onChanged: onChangeDropdownItem,
          ),
      ],
      ),
    );
  }
}
