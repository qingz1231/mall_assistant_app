import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';

Widget CustomRegularButton(String label, Color color, Function() action) {
  return TextButton(
    onPressed: () {
      print('yes');
      action();
    },
    style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        foregroundColor: txt3,
        backgroundColor: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        textStyle: TextStyle(fontSize: txt_small,fontWeight: FontWeight.w500)),
    child: Text(label),
  );
}

// InkWell CustomCircularButton(double height,IconData icon, Function() action) {
//   Color color = ;
//   return InkWell(
//     onTap: () {
//       action();
//     },
//     child: Container(
//       height: height,
//       width: height,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: btn1, // Set the background color of the circle
//       ),
//       child: Center(
//         child: Icon(
//           icon,
//           color: txt1, // Set the color of the icon
//         ),
//       ),
//     ),
//   );
//}
