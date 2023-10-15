import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import '../utils/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/titleDesc.dart';

class ShopDetail extends StatelessWidget {
  const ShopDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      //'https://mall-assistant-system.s3.amazonaws.com/adminLogin-bg.jpg

      child: Scaffold(
          body: Column(
        children: [
          Stack(
            children: [
              Container(height: screenHeight / 3 + (80/2),width:screenWidth),

              Container(
                height: screenHeight / 3,
                width: screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://mall-assistant-system.s3.amazonaws.com/adminLogin-bg.jpg'),
                        fit: BoxFit.cover)),
              ),
              

              Positioned(
                top: screenHeight/3 - 40,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://mall-assistant-system.s3.amazonaws.com/1x1.jpg')
                      )
                  ),
                ),
              )
              
            ],
          ),
          TitleDesc(title: 'title', description: 'description')
        ],
      )),
    );
  }

  /*
   
   */
}
