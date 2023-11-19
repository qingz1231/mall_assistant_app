import 'package:flutter/material.dart';
import 'package:mall_assistant_app/utils/navs_bars/top_bar.dart';

import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/title_desc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double heightBetween = 10;
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: CustomScrollView(
            slivers: [
              TopBar(),
    
              //content starts here
              SliverList(
                delegate: SliverChildListDelegate([
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                        
                          //advertisement section
                          Container(
                            width: screenWidth,
                            height: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.network(
                              'https://mall-assistant-system.s3.amazonaws.com/mcd-ad1.jpg', // Replace with the path to your image asset
                              fit: BoxFit.cover, // Adjust the fit as needed
                            ),
                          ),
                        
                          SizedBox(height: heightBetween),
                          TitleDesc(
                              title: "Promotion", description: "Limited Time only"),
                        
                          //promotion scroller
                          GridScroll(),

                          SizedBox(height: heightBetween),
                        
                          TitleDesc(
                              title: "Hungry?",
                              description: "Recommedations Just For You!"),
                        
                          GridScroll(),
                        
                        SizedBox(height: heightBetween),
                          TitleDesc(
                              title: "Events?", description: "Join in the Fun!"),
                        
                          GridScroll(),
                        ],
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
    );

  }
}