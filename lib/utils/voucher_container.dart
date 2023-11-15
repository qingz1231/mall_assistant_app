import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/utils/title_desc.dart';

import '../ui/voucher_detail.dart';




class VoucherContainer extends StatelessWidget {
  final String title;
  final String description;
  final String expiry;
  String id;

  VoucherContainer(
      {required this.title, required this.description, required this.expiry, required this.id});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VoucherDetail(voucherid: id),
            ),
          );
        },
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
      
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Set this to occupy available vertical space
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
                              fontSize: txt_medium, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
          
                        child: Text(
                          expiry,
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
      ),
    );
  }
}
