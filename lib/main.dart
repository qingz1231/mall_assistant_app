import 'package:flutter/material.dart';
import 'package:mall_assistant_app/ui/directory.dart';
import 'package:mall_assistant_app/ui/home.dart';
import 'package:mall_assistant_app/utils/horizontalGridScroll.dart';
import 'package:mall_assistant_app/utils/titleDesc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Directory(),
      routes: {
        '/home': (context) => Home(),
        '/directory': (context) => Directory(),
      },
    );
  }
}
