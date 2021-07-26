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
      body: Column( 
        children: <Character>[
          Character("1","1","1","1","1","1")
          ],
      ),
    );
  }
}


class Character{
  String name;
  String status;
  String species;
  String type;
  String gender;
  String location;

  Character(this.name, this.status, this.species, this.type, this.gender, this.location);

}

class name extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(children: [],),
    );
  }
}

