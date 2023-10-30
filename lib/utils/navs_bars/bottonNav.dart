import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';



class BottomNav extends StatefulWidget {

 
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

   void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/directory');
        break;
      case 2:
        Navigator.pushNamed(context, '/about');
        break;
      case 3:
        Navigator.pushNamed(context, '/events');
        break;
      case 4:
        Navigator.pushNamed(context, '/vouchers');
        break;
    }
  }

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;

    int index = 0;
    return NavigationBarTheme(
      data:NavigationBarThemeData(
        indicatorColor: Colors.blue.shade100,
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(fontSize: txt_small,fontWeight: FontWeight.w500,color: bg_primary)
        )
      ),
      child: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index) => setState((){this.index = index;_onItemTapped(context, index);}),
        destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        //directory
        NavigationDestination(icon: Icon(Icons.map), label: "Directory"),
    
        //about
        NavigationDestination(icon: Icon(Icons.info), label: "About"),
    
        //events
        NavigationDestination(icon: Icon(Icons.event), label: "Event"),
    
        //voucher
        NavigationDestination(
            icon: Icon(Icons.airplane_ticket), label: "Voucher"),
      ]),
    );
  }
}

