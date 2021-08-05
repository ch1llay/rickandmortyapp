import 'package:flutter/material.dart';
import 'package:rickandmortyapp/pages/CharacterPage.dart';
import 'package:rickandmortyapp/pages/CharactersPage.dart';

import 'LocationsPage.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      RaisedButton(
          child: Column(
            children: [Text("Персонажи"), Icon(Icons.person)],
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => CharactersPage()))),
      RaisedButton(
          child: Column(
            children: [Text("Локации 📍")],
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => LocationsPage()))),
    ]);
  }
}
