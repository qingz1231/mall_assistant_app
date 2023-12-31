import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/ui/splash_screen.dart';
import 'package:mall_assistant_app/user_preference.dart';
import 'package:mall_assistant_app/utils/profile_row.dart';
import '../entity/Customer.dart';
import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/profile_pic.dart';
import '../utils/title_desc.dart';
import 'my_bookmark.dart';
import 'my_voucher.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<Customer>(
        future: RememberUserPrefs.loadCurrentUser(),
        builder: (context, snapshot) => snapshot.hasData
            ? Scaffold(
                body: Center(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      color: bg_primary,
                      width: screenWidth,
                      height: screenHeight / 4.5,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          children: [
                            RoundedImage(
                                'https://mall-assistant-system.s3.amazonaws.com/1x1.jpg',
                                screenWidth / 4,
                                screenWidth / 4),
                            SizedBox(width: 30),
                            Text(
                              "Hi, " + snapshot.data!.customerName! + " !",
                              style: TextStyle(
                                  fontSize: txt_large,
                                  color: txt3,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    //todo:change the width and height to a variable to calculate
                    //todo: custom row change to class to set the width and height
                    CustomRow(
                        TitleDesc(
                            title: "Edit Profile",
                            description: "Manage your Personal Info"),
                        screenWidth,
                        (screenHeight - screenHeight / 4.5) / 8),
                    CustomRow(
                        GestureDetector(

                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyVoucher(),
                            ),
                          ),

                          child: TitleDesc(
                              title: "My Voucher",
                              description: "Manage your account vouchers"),
                        ),
                        screenWidth,
                        (screenHeight - screenHeight / 4.5) / 8),
                    CustomRow(
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyBookmark(),
                            ),
                          ),
                          child: TitleDesc(
                              title: "My Bookmark",
                              description: "Manage your boookmarks"),
                        ),
                        screenWidth,
                        (screenHeight - screenHeight / 4.5) / 8),
                    CustomRow(
                        TitleDesc(
                            title: "Edit Preference",
                            description: "Manage your personalised experience"),
                        screenWidth,
                        (screenHeight - screenHeight / 4.5) / 8),
                    //to be replaced with additional settings
                    SizedBox(height: (screenHeight - screenHeight / 4.5) / 8),
                    SizedBox(height: (screenHeight - screenHeight / 4.5) / 8),
                    SizedBox(height: (screenHeight - screenHeight / 4.5) / 8),

                    Container(
                      width: screenWidth - 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle login logic here
                          RememberUserPrefs.deleteCurrentUser();
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            backgroundColor: bg2,
                            textStyle: TextStyle(fontSize: txt_medium),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        child: Text(logout),
                      ),
                    ),
                  ],
                )),
              )
            : SplashScreen());
  }
}
