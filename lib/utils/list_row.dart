import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/utils/title_desc.dart';

import '../ui/shop_detail.dart';

class ListRow extends StatelessWidget {
  final String title;
  final String description;
  final String id;

  ListRow({required this.title, required this.description,required this.id});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopDetail(itemId: id),
            ),
          );
          //Navigator.pushNamed(context, '/shopDetail');
        },
        child: Container(
          child: Row(
            children: [
              Container(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://mall-assistant-system.s3.amazonaws.com/1x1.jpg')))),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  height: screenWidth * 0.3,
                  child: Column(
                    mainAxisSize: MainAxisSize
                        .min, // Set this to occupy available vertical space
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: txt_large, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          description,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: txt_medium,
                              color: txt2,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
