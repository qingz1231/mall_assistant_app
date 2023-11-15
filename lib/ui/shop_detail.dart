import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/service/bookmark_service.dart';
import 'package:mall_assistant_app/ui/splash_screen.dart';
import 'package:mall_assistant_app/user_preference.dart';
import 'package:mall_assistant_app/utils/customButton.dart';
import 'package:mall_assistant_app/utils/read_more.dart';
import '../entity/Customer.dart';
import '../entity/Shop.dart';
import '../service/shop_service.dart';
import '../utils/icon_btn.dart';
import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/title_desc.dart';

class ShopDetail extends StatefulWidget {
  final String itemId;
  ShopDetail({required this.itemId});

  @override
  _ShopDetailState createState() => _ShopDetailState(itemId: this.itemId);
}

class _ShopDetailState extends State<ShopDetail> {
  final String itemId;

  _ShopDetailState({required this.itemId});

  late Shop _shop = Shop(); // Initialize it to an empty list

  @override
  void initState() {
    super.initState();

    //_loadShop();

    // Call the fetchShops method when the widget is inserted into the tree
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double functionHeight = screenHeight / 18;

    return SafeArea(
      //'https://mall-assistant-system.s3.amazonaws.com/adminLogin-bg.jpg

      child: Scaffold(
          body: FutureBuilder(
              future: ShopService.getShopById(itemId),
              builder: (context, snapshot) => snapshot.hasData
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                  height: screenHeight / 3 + (80 / 2),
                                  width: screenWidth),
                              Container(
                                height: screenHeight / 3,
                                width: screenWidth,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snapshot.data!.shop!.imageUrl!),
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
                          TitleDesc(
                              title: snapshot.data!.shop!.shopName!,
                              description: snapshot.data!.shop!.shopLocation!),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.4,
                                  child:
                                      CustomRegularButton(map, bg2, () => null),
                                ),
                                Container(
                                  width: screenWidth * 0.15,
                                  child: CustomIconBtn(
                                      height: functionHeight,
                                      icon: Icons.favorite,
                                      clicked: snapshot.data!.isSaved!,
                                      onTapFunction: (bool saved) async {
                                
                                        Customer customer =
                                            await RememberUserPrefs
                                                .loadCurrentUser();
                                        saved
                                            ? BookmarkService.remove(
                                                customer.customerId!,
                                                itemId,
                                                '1')
                                            : BookmarkService.save(
                                                customer.customerId!,
                                                itemId,
                                                '1');
                                      }),
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
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    child: ReadMore(
                                        snapshot.data!.shop!.shopDesc!, 5,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400)))
                              ],
                            ),
                          ),
                          Container(
                            child: Wrap(
                                spacing:
                                    16.0, // Horizontal spacing between buttons
                                runSpacing:
                                    16.0, // Vertical spacing between rows of buttons
                                children: [
                                  CustomRegularButton(
                                      "test", bg_secondary, () => null),
                                  CustomRegularButton(
                                      "test", bg_secondary, () => null),
                                  CustomRegularButton(
                                      "test", bg_secondary, () => null),
                                  CustomRegularButton(
                                      "test", bg_secondary, () => null),
                                  CustomRegularButton(
                                      "test", bg_secondary, () => null),
                                  CustomRegularButton(
                                      "test", bg_secondary, () => null),
                                  CustomRegularButton(
                                      "test", bg_secondary, () => null),
                                ]),
                          )
                        ],
                      ),
                    )
                  : SplashScreen())),
    );
  }

  /*
   
   */
}
