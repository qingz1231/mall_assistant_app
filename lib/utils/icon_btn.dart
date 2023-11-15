import 'package:flutter/material.dart';
import 'package:mall_assistant_app/entity/Bookmark.dart';

import '../consts/colors.dart';

class CustomIconBtn extends StatefulWidget {
  final double height;
  final IconData icon;
  final bool clicked;
  final Function(bool saved)? onTapFunction;

  CustomIconBtn({required this.height,required this.icon,required this.clicked, required this.onTapFunction});

  @override
  State<CustomIconBtn> createState() => _CustomIconBtnState(height:height,icon:icon,clicked: clicked);
}

class _CustomIconBtnState extends State<CustomIconBtn> {
  @override
  final double height;
  final IconData icon;
  bool clicked;


  _CustomIconBtnState({required this.height,required this.icon, required this.clicked});
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () async {


      widget.onTapFunction!(clicked);
      setState(() {
              clicked = !clicked;
      });
    },
    child: Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: clicked?bg_primary:btn1, // Set the background color of the circle
      ),
      child: Center(
        child: Icon(
          icon,
          color: clicked?txt3:txt1, // Set the color of the icon
        ),
      ),
    ),
  );
  }
}