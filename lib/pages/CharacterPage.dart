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

  var colorCircle;

  CharacterPageWidget(this.name, this.status, this.species, this.type,
      this.gender, this.location, this.image, this.episodes);

  @override
  Widget build(BuildContext context) {
    if (status == "Alive")
      colorCircle = Colors.green;
    else
      colorCircle = Colors.grey;
    return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(alignment: Alignment.center, child: Image.network(image)),
            Text(name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Live Status", style: TextStyle(color: Colors.grey)),
            Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorCircle,
                  ),
                ),
                Text(status),
              ],
            ),
            Container(margin: EdgeInsets.only(bottom: 5)),
            Text("Species and Gender", style: TextStyle(color: Colors.grey)),
            Text("$species($gender)"),
            Container(margin: EdgeInsets.only(bottom: 5)),
            Text("Last known location", style: TextStyle(color: Colors.grey)),
            Text(location),
            Container(margin: EdgeInsets.only(bottom: 5)),
            Text("First seen in", style: TextStyle(color: Colors.grey)),
            Text(episodes[0]["name"]),
            Container(margin: EdgeInsets.only(bottom: 10)),
            Text("Episodes",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Container(margin: EdgeInsets.only(bottom: 5)),
            for (int i = 0; i < episodes.length; i++) _buildEpisode(i)
          ], // верстка страницы
        ));
  }

  Widget _buildEpisode(int i) => Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 5, right: 5),
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(episodes[i]["name"]),
              Text(
                episodes[i]["episode"],
                textAlign: TextAlign.end,
              )
            ],
          ),
          Text(episodes[i]["date"]),
        ],
      ));
}
