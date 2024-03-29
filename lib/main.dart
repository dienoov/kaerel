import 'package:flutter/material.dart';
import 'package:kaerel/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        colorSchemeSeed: Colors.indigo[800],
      ),
      home: HomePage(),
      title: 'MRT Jakarta',
    );
  }
}
