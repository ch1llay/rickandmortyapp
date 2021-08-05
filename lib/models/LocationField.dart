import "package:flutter/material.dart";

class LocationField extends StatelessWidget {
  final String name;
  final String type;
  final String dimension;
  final String created;

  LocationField(this.name, this.type, this.dimension, this.created);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        color: Colors.grey,
        child: Column(children: [
          Row(children: [
            Text(name, style: TextStyle(fontSize: 20)),
            Padding(padding: EdgeInsets.only(right: 5)),
            Text(type, style: TextStyle(fontSize: 18))
          ]),
          Padding(padding: EdgeInsets.only(bottom: 5)),
          Row(children: [
            Text(dimension, style: TextStyle(fontSize: 14)),
            Padding(padding: EdgeInsets.only(right: 5)),
            Text(created, style: TextStyle(fontSize: 14))
          ])
        ]));
  }
}
