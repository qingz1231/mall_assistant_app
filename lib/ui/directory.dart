import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/colors.dart';
import 'package:mall_assistant_app/service/shop_service.dart';
import 'package:mall_assistant_app/utils/horizontalGridScroll.dart';
import 'package:mall_assistant_app/utils/navs_bars/top_bar.dart';
import '../entity/Shop.dart';
import '../utils/list_row.dart';
import '../utils/navs_bars/bottonNav.dart';

class Directory extends StatefulWidget {
  const Directory({Key? key}) : super(key: key);

  @override
  _DirectoryState createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  late List<Shop> _shops = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadShops();
  }

  void _loadShops() async {
    try {
      List<Shop> shops = await ShopService.getShops('1');
      setState(() {
        _shops = shops;
      });
    } catch (error) {
      print('Error loading shops: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: CustomScrollView(
        controller: _scrollController, // Attach the ScrollController
        slivers: [
          TopBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              SingleChildScrollView(
                controller: _scrollController, // Attach the ScrollController
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CategoryGridScroll(),
                      Container(
                        width: screenWidth,
                        child: Text(
                          "Total Shops" + "(" + _shops.length.toString() + ")",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < _shops.length; i++)
                            ListRow(
                              title: _shops[i].shopName!,
                              description: _shops[i].shopLocation!,
                              id: _shops[i].id!,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bg2,
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
