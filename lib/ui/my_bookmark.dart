import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/utils/bookmark_container.dart';
import 'package:mall_assistant_app/utils/navs_bars/title_appBar.dart';
import 'package:mall_assistant_app/utils/voucher_container.dart';

import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/title_desc.dart';

class MyBookmark extends StatelessWidget {
  const MyBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
  
        body: SingleChildScrollView(
          child: Column(
            children: [
              BookmarkContainer(title: "name", description: "shop",expiry: "expirity date",),
           
            ],
          ),
        ),
        appBar: TitleAppBar(myBookmark, context),

   
      
      );
  }
}