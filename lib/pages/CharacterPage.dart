import 'package:dio/dio.dart';
import "package:flutter/material.dart";

class CharacterPage extends StatefulWidget {
  final int id;
  CharacterPage(this.id);
  @override
  _CharacterPageState createState() => _CharacterPageState(id);
}

class _CharacterPageState extends State<CharacterPage> {
  final int id;
  _CharacterPageState(this.id);
  Map data = {};
  bool _isLoading = false;
  List episodes = [];

  void getHttp() async {
    try {
      var response = await Dio()
          .get('https://rickandmortyapi.com/api/character/${id + 1}');
      print(22);
      var tempEpisodes = [];
      print(response.data);
      print(response.data["episode"]);
      for (var e in response.data["episode"]) {
        print("$e 24");
        var responseEpisode = await Dio().get(e);
        var episodesInfo = responseEpisode.data;
        tempEpisodes.add({
          "name": episodesInfo["name"],
          "date": episodesInfo["air_date"],
          "episode": episodesInfo["episode"]
        });
      }
      setState(() {
        _isLoading = true;
        data = response.data;
        episodes = tempEpisodes;
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
              CharacterPageWidget(
                  data["name"],
                  data["status"],
                  data["species"],
                  data["type"],
                  data["gender"],
                  data["location"]["name"],
                  data["image"],
                  episodes)
          else
            Center(child: Text("загрузка")),
        ],
      ),
    );
  }
}

class CharacterPageWidget extends StatelessWidget {
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String location;
  final String image;
  final List episodes;

  CharacterPageWidget(this.name, this.status, this.species, this.type,
      this.gender, this.location, this.image, this.episodes);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Image.network(image)),
        Text(name),
        Text("Live Status"),
        Text(status),
        Text("Species and Gender"),
        Text("$species($gender)"),
        Text("Last known location"),
        Text(location),
        Text("First seen in"),
        Text(episodes[0]["name"]),
        Text("Episodes"),
        for (int i = 0; i < episodes.length; i++) _buildEpisode(i)
      ], // верстка страницы
    );
  }

  Widget _buildEpisode(int i) => Container(
          child: Column(
        children: [
          Row(
            children: [Text(episodes[i]["name"]), Text(episodes[i]["episode"])],
          ),
          Text(episodes[i]["date"]),
        ],
      ));
}
