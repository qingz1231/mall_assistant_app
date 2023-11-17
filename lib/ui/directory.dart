import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mall_assistant_app/service/shop_service.dart';
import 'package:mall_assistant_app/utils/navs_bars/top_bar.dart';
import '../api/mysql.dart';
import '../entity/Shop.dart';
import '../utils/list_row.dart';
import '../utils/navs_bars/bottonNav.dart';
import 'package:http/http.dart' as http;

class Directory extends StatefulWidget {
  const Directory({Key? key}) : super(key: key);

  @override
  _DirectoryState createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  // Add a method to fetch shops from the API

  late List<Shop> _shops = []; // Initialize it to an empty list

  @override
  void initState() {
    super.initState();
    debugPrint("testing");

    _loadShops();
    // Call the fetchShops method when the widget is inserted into the tree
  }

  void _loadShops() async {
    try {
      print("Load shop");
      // Assuming ShopService.getShops(1) returns a Future<List<Shop>>
      List<Shop> shops = await ShopService.getShops('1');
      print("Load finish");
      // Set the state with the retrieved shops
      setState(() {
        _shops = shops;
      });
    } catch (error) {
      // Handle any errors that occurred during the asynchronous operation
      print('Error loading shops: $error');
      // You might want to show an error message to the user or handle it differently
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: CustomScrollView(
        slivers: [
          TopBar(),
    
          // content starts here
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
                    ),
    
    
                    Column(
                       children: [
                    for(int i = 0;i < _shops.length;i++)
                      ListRow(title: _shops[i].shopName!, description: _shops[i].shopLocation!,id: _shops[i].id!)
                    
                    ]
                    ),
    
                    //  
    
                    // Column(
                    //   children: [
                    //     if (_shops.isNotEmpty)
                    //       ListRow(
                    //         title: _shops[0].shopName!,
                    //         description: _shops[0].shopLocation!,
                    //       )
                    //     else
                    //       Text(
                    //           'No shops available'), // Provide a message when the list is empty
                    //   ],
                    // ),
    
                    // Column(
                    //   children: [
                    //     ListRow(title: "title", description: "location"),
                    //     ListRow(title: "title", description: "location"),
                    //     ListRow(title: "title", description: "location"),
                    //   ],
                    // ),
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
