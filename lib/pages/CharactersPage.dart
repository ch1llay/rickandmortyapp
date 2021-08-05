import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:rickandmortyapp/models/CharacterField.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  List data = [];
  bool _isLoading = false;
  String text = "";

  void getHttp() async {
    try {
      var response =
          await Dio().get('https://rickandmortyapi.com/api/character');
      setState(() {
        _isLoading = true;
        data = response.data["results"];
        print("${data[0]["name"]} homePage");
      });
    } catch (e) {
      print(e);
      text = e.toString();
      _controller.reset();
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
        body: ListView(children: [
          Text(text),
          if (_isLoading)
            for (int i = 0; i < data.length; i++)
              CharacterField(
                  i,
                  data[i]["name"],
                  data[i]["status"],
                  data[i]["species"],
                  data[i]["type"],
                  data[i]["gender"],
                  data[i]["location"]["name"],
                  data[i]["image"])
          else
            Column(children: [
              Text("Загрузка"),
              RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_circle_down, size: 60)))
            ])
        ]));
  }
}
