import 'package:flutter/material.dart';
import 'package:rickandmortyapp/pages/MenuPage.dart';
import 'package:rickandmortyapp/pages/CharactersPage.dart';

void main() {
  // debugPaintSizeEnabled = true;
  return runApp(MyApp());
}

// Map<String, String> download() {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Characters',
      theme: ThemeData.dark(),
      home: CharactersPage(),
    );
  }
}
