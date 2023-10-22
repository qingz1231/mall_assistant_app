import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/utils/customButton.dart';
import 'package:mall_assistant_app/utils/read_more.dart';
import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/title_desc.dart';

class VoucherDetail extends StatelessWidget {
  const VoucherDetail({super.key});

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
                Container(height: screenHeight / 3, width: screenWidth),
                Container(
                  height: screenHeight / 3,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://mall-assistant-system.s3.amazonaws.com/adminLogin-bg.jpg'),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "expiry date",
                      style: TextStyle(color: txt2, fontSize: txt_small),
                    ),
                  ),
                  TitleDesc(title: 'title', description: 'description'),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.25,
                          child: CustomRegularButton(shop, bg2, () => null),
                        ),
                        Container(
                          width: screenWidth * 0.25,
                          child: CustomRegularButton(map, bg2, () => null),
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
                          termsCondition,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            child: ReadMore(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula, dui eget varius scelerisque, erat tortor hendrerit urna, vel ultricies augue dolor vel eros. Quisque sollicitudin, dui id congue congue, dolor nulla tincidunt purus, nec hendrerit libero libero id ipsum.Suspendisse non lacinia risus. Donec vestibulum, libero eu finibus facilisis, tortor orci venenatis libero, nec elementum libero nisi id arcu. Vivamus suscipit eget odio sit amet tincidunt. Maecenas vel vulputate ligula, nec dignissim libero.Fusce ullamcorper volutpat justo, ut volutpat elit accumsan et. Curabitur nec metus id dui sagittis lacinia ut sit amet ligula. Nullam non augue ut metus fringilla iaculis. Nulla facilisi. Morbi dignissim, augue ac cursus interdum, eros dui tristique massa, a gravida urna augue at nisi. Curabitur luctus sit amet erat eget feugiat.",
                                5,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400)))
                      ],
                    ),
                  ),
                  Container(
                      width: screenWidth,
                      padding: EdgeInsets.all(15),
                      child: CustomRegularButton(
                          'Claim Voucher', bg_primary, () => null))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  /*
   
   */
}
