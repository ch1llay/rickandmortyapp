import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:rickandmortyapp/models/CharacterField.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  bool _isLoading = false;

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
      body: ListView(
        children: [
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
            Center(child: Text("загрузка")),
        ],
      ),
    );
  }
}
