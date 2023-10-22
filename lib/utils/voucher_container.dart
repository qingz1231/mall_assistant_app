import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/utils/title_desc.dart';

class VoucherContainer extends StatelessWidget {
  final String title;
  final String description;
  final String expiry;

  VoucherContainer(
      {required this.title, required this.description, required this.expiry});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: border1), color: txt3),
        child: Row(
          children: [
            Container(
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://mall-assistant-system.s3.amazonaws.com/1x1.jpg')))),
            Expanded(
              child: Container(
                height: screenWidth * 0.3,
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Set this to occupy available vertical space
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black,
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: txt_large, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Text(
                        description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: txt_medium, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      color: Colors.yellow,
                      child: Text(
                        'expiry date',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: txt_small, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
