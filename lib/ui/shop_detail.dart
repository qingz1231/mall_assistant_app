import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/utils/customButton.dart';
import 'package:mall_assistant_app/utils/read_more.dart';
import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/title_desc.dart';

class ShopDetail extends StatelessWidget {
  const ShopDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double functionHeight = screenHeight / 18;
    return SafeArea(
      //'https://mall-assistant-system.s3.amazonaws.com/adminLogin-bg.jpg

      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: screenHeight / 3 + (80 / 2), width: screenWidth),
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
                  top: screenHeight / 3 - 40,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://mall-assistant-system.s3.amazonaws.com/1x1.jpg'))),
                  ),
                )
              ],
            ),
            TitleDesc(title: 'title', description: 'description'),
            Container(
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.4,
                    child: CustomRegularButton(map, bg2, () => null),
                  ),
                  Container(
                    width: screenWidth * 0.15,
                    child: CustomCircularButton(
                        functionHeight, Icons.thumb_up, () => null),
                  ),
                  Container(
                    width: screenWidth * 0.15,
                    child: CustomCircularButton(
                        functionHeight, Icons.thumb_down, () => null),
                  ),
                  Container(
                    width: screenWidth * 0.15,
                    child: CustomCircularButton(
                        functionHeight, Icons.favorite, () => null),
                  ),
                  Container(
                    width: screenWidth * 0.15,
                    child: CustomCircularButton(
                        functionHeight, Icons.add, () => null),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detail,
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      child: ReadMore(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula, dui eget varius scelerisque, erat tortor hendrerit urna, vel ultricies augue dolor vel eros. Quisque sollicitudin, dui id congue congue, dolor nulla tincidunt purus, nec hendrerit libero libero id ipsum.Suspendisse non lacinia risus. Donec vestibulum, libero eu finibus facilisis, tortor orci venenatis libero, nec elementum libero nisi id arcu. Vivamus suscipit eget odio sit amet tincidunt. Maecenas vel vulputate ligula, nec dignissim libero.Fusce ullamcorper volutpat justo, ut volutpat elit accumsan et. Curabitur nec metus id dui sagittis lacinia ut sit amet ligula. Nullam non augue ut metus fringilla iaculis. Nulla facilisi. Morbi dignissim, augue ac cursus interdum, eros dui tristique massa, a gravida urna augue at nisi. Curabitur luctus sit amet erat eget feugiat.",
                          5,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400)))
                ],
              ),
            ),
            Container(
              child: Wrap(
                  spacing: 16.0, // Horizontal spacing between buttons
                  runSpacing: 16.0, // Vertical spacing between rows of buttons
                  children: [
                    CustomRegularButton("test", bg_secondary, () => null),
                    CustomRegularButton("test", bg_secondary, () => null),
                    CustomRegularButton("test", bg_secondary, () => null),
                    CustomRegularButton("test", bg_secondary, () => null),
                    CustomRegularButton("test", bg_secondary, () => null),
                    CustomRegularButton("test", bg_secondary, () => null),
                    CustomRegularButton("test", bg_secondary, () => null),
                  ]),
            )
          ],
        ),
      )),
    );
  }

  /*
   
   */
}
