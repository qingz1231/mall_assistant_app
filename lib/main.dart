import 'package:flutter/material.dart';
import 'package:mall_assistant_app/ui/directory.dart';
import 'package:mall_assistant_app/ui/home.dart';
import 'package:mall_assistant_app/ui/login.dart';
import 'package:mall_assistant_app/ui/profile.dart';
import 'package:mall_assistant_app/ui/register.dart';
import 'package:mall_assistant_app/ui/shop_detail.dart';
import 'package:mall_assistant_app/ui/splash_screen.dart';
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
      home: ShopDetail(),
      routes: {
        '/home': (context) => Home(),
        '/directory': (context) => Directory(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/profile': (context) => Profile(),
        '/shopDetail': (context) => ShopDetail(),

      },
    );
  }
}
