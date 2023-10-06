import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';

Widget RoundedImage(String image,double width,double height) {
  return Container(
    width: width, // Set the desired width
    height: height, // Set the desired height
    decoration: BoxDecoration(
        shape: BoxShape.circle, // Makes the container circular
        image: DecorationImage(image: NetworkImage(image))),
  );
}
