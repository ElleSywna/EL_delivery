import 'package:flutter/material.dart';
import 'package:elenna_delivery/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Resto',
      home: HomePage(),
    );
  }
}
