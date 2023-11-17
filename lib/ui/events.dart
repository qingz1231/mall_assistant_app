import 'package:flutter/material.dart';
import 'package:mall_assistant_app/utils/navs_bars/top_bar.dart';
import '../utils/list_row.dart';
import '../utils/navs_bars/bottonNav.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      bottomNavigationBar: BottomNav(),
      body: CustomScrollView(
            slivers: [
              TopBar(),
    
              //content starts here
              SliverList(
                delegate: SliverChildListDelegate([
                  SingleChildScrollView(
                    child: Column(
                      children: [
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
                        Container(
                          width: screenWidth,
                          child: Text(
                            "Total Events",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          
                        ),
                        Column(
                          children: [
                            // ListRow(title: "title", description: "locaction"),
                            // ListRow(title: "title", description: "locaction"),
                            // ListRow(title: "title", description: "locaction"),
                      
                          ],
                        )
                        
                        
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
    );
  }
}