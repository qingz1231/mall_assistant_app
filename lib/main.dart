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
import 'package:mall_assistant_app/utils/title_desc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/directory': (context) => Directory(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/profile': (context) => Profile(),
        '/events': (context) => Events(),
        '/vouchers': (context) => MallVoucher(),

        '/shopDetail': (context) => ShopDetail(),
        '/myVoucher': (context) => MyVoucher(),
        '/voucherDetail': (context) => VoucherDetail(),
        '/myBookmark': (context) => MyBookmark(),
      },
    );
  }
}
