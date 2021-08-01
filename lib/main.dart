import 'package:flutter/material.dart';
import "package:flutter/rendering.dart" show debugPaintSizeEnabled;
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:dio/dio.dart';

List data = [];
List<CharacterField> characters = [];

void main() {
  // debugPaintSizeEnabled = true;
  // print(getData()["type"]);
  // for (int i = 0; i < 2; i++) print(data[i].toString());
  return runApp(MyApp());
}

// Map<String, String> download() {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Characters',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getHttp() async {
    try {
      var response =
          await Dio().get('https://rickandmortyapi.com/api/character');
      data = response.data["results"];
      print(data[0]["name"]);
      setState(() {
        for (int i = 0; i < data.length; i++)
          characters.add(CharacterField.character(
              data[i]["name"].toString(),
              data[i]["status"].toString(),
              data[i]["species"].toString(),
              data[i]["type"].toString(),
              data[i]["gender"].toString(),
              data[i]["location"].toString(),
              data[i]["image"].toString()));
      });
      print(data[0]["name"]);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Rick and Morty Characters"),
      ),
      body: Column(children: characters),
      //for (int i = 0; i < 2; i++)
      // CharacterField.character(
      //     data[0]["name"],
      //     data[0]["status"],
      //     data[0]["species"],
      //     data[0]["type"],
      //     data[0]["gender"],
      //     data[0]["location"],
      //     data[0]["image"])
      // ]
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
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Text(""),
          Container(child: Image.network(image), width: 100, height: 100),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
      ),
    );
  }
}
