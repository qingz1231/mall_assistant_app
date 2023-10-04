import 'package:flutter/material.dart';
import 'package:mall_assistant_app/utils/horizontalGridScroll.dart';
import 'package:mall_assistant_app/utils/titleDesc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Tap to Change", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                print('Profile button pressed');
              },
            ),
          ],
        ),
        
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //search section
              
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

              TitleDesc(title: "Promotion", description: "Limited Time only"),

              //promotion scroller
              GridScroll(),

              TitleDesc(
                  title: "Hungry?",
                  description: "Recommedations Just For You!"),

              GridScroll(),

              TitleDesc(
                  title: "Events?",
                  description: "Join in the Fun!"),

              GridScroll(),
            ],
          ),

          
        ),
        bottomNavigationBar: Container(
          width: screenWidth,
          color: Colors.black,
          child: BottomNavigationBar(
            
            items: [
            //home
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            //directory
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "Directory"),
        
            //about
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        
            //events
            BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),
        
            //voucher
             BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: "Voucher"),
          ],
          selectedItemColor: Colors.blue, // Color for unselected icons
          unselectedItemColor: Colors.blue, // Color for unselected icons
          ),
        ),
      ),
    );
  }
}
