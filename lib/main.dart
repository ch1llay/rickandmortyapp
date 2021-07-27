import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Rick and Morty Characters"),
      ),
      body: Column(children: <CharacterField>[
        CharacterField.character(
            "name",
            "status",
            "species",
            "type",
            "gender",
            "location",
            "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
      ]),
    );
  }
}

class CharacterField extends StatelessWidget {
  String name;
  String status;
  String species;
  String type;
  String gender;
  String location;
  String image;

  CharacterField.character(this.name, this.status, this.species, this.type,
      this.gender, this.location, this.image);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(child: Image.network(image), width: 100, height: 100),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Text(name),
              Row(
                children: [
                  Text(status),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(species),
                  ),
                ],
              ),
              Text("Last known location:"),
              Text(location),
            ],
          ),
        )
      ],
    );
  }
}
