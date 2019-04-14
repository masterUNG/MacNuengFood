import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/add_food.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddFood(),
    );
  }
}
