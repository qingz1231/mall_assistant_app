import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import '../utils/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/profile_pic.dart';
import '../utils/titleDesc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body:Center(
            child:Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  color: bg_primary,
                  width: screenWidth,
                  height: screenHeight/4,
                  child:  RoundedImage('https://mall-assistant-system.s3.amazonaws.com/1x1.jpg',100,100),
                )
              ],
              )
          
           ),
        
       
        
      ),
    );
  }
}
