import 'package:flutter/material.dart';
import 'package:mall_assistant_app/ui/directory.dart';
import 'package:mall_assistant_app/ui/events.dart';
import 'package:mall_assistant_app/ui/home.dart';
import 'package:mall_assistant_app/ui/login.dart';
import 'package:mall_assistant_app/ui/mall_voucher.dart';
import 'package:mall_assistant_app/ui/my_bookmark.dart';
import 'package:mall_assistant_app/ui/my_voucher.dart';
import 'package:mall_assistant_app/ui/profile.dart';
import 'package:mall_assistant_app/ui/register.dart';
import 'package:mall_assistant_app/ui/shop_detail.dart';
import 'package:mall_assistant_app/ui/splash_screen.dart';
import 'package:mall_assistant_app/ui/voucher_detail.dart';
import 'package:mall_assistant_app/utils/horizontalGridScroll.dart';
import 'package:mall_assistant_app/utils/navs_bars/bottonNav.dart';
import 'package:mall_assistant_app/utils/title_desc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Login(),
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/directory': (context) => Directory(),
        '/register': (context) => Register(),
        '/profile': (context) => Profile(),
        '/events': (context) => Events(),
        '/vouchers': (context) => MallVoucher(),
        '/myVoucher': (context) => MyVoucher(),
        '/myBookmark': (context) => MyBookmark(),
      },
    );
  }
}
