import 'package:flutter/material.dart';
import 'package:rickandmortyapp/pages/CharacterPage.dart';
import 'package:rickandmortyapp/pages/CharactersPage.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
          child: Container(child: Text("Персонажи")),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => CharactersPage())))
    ]);
  }
}
