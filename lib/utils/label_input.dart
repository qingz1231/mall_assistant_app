import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';

Widget LabelInput(String label, String hint, controller) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: TextStyle(fontSize: txt_small,color: txt1,fontWeight: FontWeight.w500),),
        SizedBox(height: 5,),
        TextFormField(
          controller: controller,
          decoration:InputDecoration(
            hintStyle: TextStyle(
              color: txt2
            ),
            hintText: hint,
            isDense: true,
            fillColor: bg3,
            filled: true,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: bg_secondary))
          )
        )


      ]
      ),
  );
}