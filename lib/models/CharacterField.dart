import "package:flutter/material.dart";

class CharacterField extends StatelessWidget {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String location;
  final String image;

  CharacterField(this.id, this.name, this.status, this.species, this.type,
      this.gender, this.location, this.image);

  @override
  Widget _buildCharacterPage() => Column(
        children: [
          Container(child: Image.network(image)),
          Text(name),
          Text("Live status")
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => 1,
        child: Container(
          color: Colors.grey[800],
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              Text(""),
              Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Image.network(image),
                  width: 100,
                  height: 100),
              Flexible(
                child: Container(
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
                ),
              )
            ],
          ),
        ));
  }
}
