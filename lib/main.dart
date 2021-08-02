import 'package:flutter/material.dart';
import 'package:rickandmortyapp/pages/home_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}
