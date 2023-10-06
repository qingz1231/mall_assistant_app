import 'package:flutter/material.dart';
import 'package:mall_assistant_app/ui/home.dart';
import '../consts/consts.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // changeScreen(){
  //   Future.delayed(Duration(seconds:3),(){
  //     Get.to(() => const Home());
  //   })
  // }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bg3,
      body: Center(
        child:Column(
          
          children: [
            SizedBox(height:screenHeight/2 - 100),
            Image.asset(logo,width: 200)
          ],
          )
      )
    );
  }
}