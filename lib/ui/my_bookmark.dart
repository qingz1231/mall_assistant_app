import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/entity/UserShop.dart';
import 'package:mall_assistant_app/service/bookmark_service.dart';
import 'package:mall_assistant_app/ui/splash_screen.dart';
import 'package:mall_assistant_app/utils/bookmark_container.dart';
import 'package:mall_assistant_app/utils/navs_bars/title_appBar.dart';
import '../entity/Customer.dart';
import '../user_preference.dart';
import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/title_desc.dart';

class MyBookmark extends StatefulWidget {
  const MyBookmark({Key? key}) : super(key: key);

  @override
  _MyBookmarkState createState() => _MyBookmarkState();
}

class _MyBookmarkState extends State<MyBookmark> {
  late Future<List<UserShop>> bookmarks;

  @override
  void initState() {
    super.initState();
    // Delay the loading of data for 2 seconds
    bookmarks = Future.delayed(Duration(seconds: 1), () {
      return BookmarkService.getBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder(
        future: bookmarks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < snapshot.data!.length; i++)
                    BookmarkContainer(
                      title: snapshot.data![i].shop!.shopName!,
                      description: snapshot.data![i].shop!.shopLocation!,
                      clicked: snapshot.data![i].isSaved!,
                      id:snapshot.data![i].shop!.id!,
                      onTapFunction: (bool saved) async {
                        Customer customer =
                            await RememberUserPrefs.loadCurrentUser();
                        if (saved) {
                          BookmarkService.remove(
                              customer.customerId!,
                              snapshot.data![i].shop!.id!,
                              '1');
                        } else {
                          BookmarkService.save(
                              customer.customerId!,
                              snapshot.data![i].shop!.id!,
                              '1');
                        }
                      },
                    ),
                ],
              ),
            );
          } else {
            // Handle other states
            return SplashScreen();
          }
        },
      ),
      appBar: TitleAppBar(myBookmark, context),
    );
  }
}
