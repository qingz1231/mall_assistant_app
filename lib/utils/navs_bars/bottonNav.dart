import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
          width: screenWidth,
          child: BottomNavigationBar(
            items: [
              //home
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              //directory
              BottomNavigationBarItem(
                  icon: Icon(Icons.map), label: "Directory"),

              //about
              BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),

              //events
              BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),

              //voucher
              BottomNavigationBarItem(
                  icon: Icon(Icons.airplane_ticket), label: "Voucher"),
            ],
            selectedItemColor: Colors.blue, // Color for unselected icons
            unselectedItemColor: Colors.blue, // Color for unselected icons
          ),
        );
  }
}