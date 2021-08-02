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

  var colorCircle;

  CharacterField(this.id, this.name, this.status, this.species, this.type,
      this.gender, this.location, this.image);

  // @override
  // Widget _buildCharacterPage() => Column(
  //       children: [
  //         Container(child: Image.network(image)),
  //         Text(name),
  //         Text("Live status")
  //       ],
  //     );

  @override
  Widget build(BuildContext context) {
    if (status == "Alive")
      colorCircle = Colors.green;
    else
      colorCircle = Colors.grey;
    return GestureDetector(
        onTap: () => print(name),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Image.network(image),
                  ),
                  flex: 3),
              Flexible(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(species),
                          ),
                        ],
                      ),
                      Text("Last known location:",
                          style: TextStyle(color: Colors.grey[500])),
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
