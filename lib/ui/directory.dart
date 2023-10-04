import 'package:flutter/material.dart';
import 'package:mall_assistant_app/utils/topBar.dart';
import '../utils/bottonNav.dart';

class Directory extends StatelessWidget {
  const Directory({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
  
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
                        child: Text(
                          "Total Shops",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        
                      )
                      
                      
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),

   
        bottomNavigationBar: BottomNav()
      );
  }
}