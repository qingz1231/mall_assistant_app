import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';

Widget CustomRow(item,width,height) {
  return Container(
    width: width, // Set the desired width
    height: height, // Set the desired height

    decoration: BoxDecoration( 
      color: txt3,
      border: Border(
      bottom: BorderSide(
        color: bg3, // Border color
        width: 2.0,         // Border width
      ),
    ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: item,),
    )
  );
}
