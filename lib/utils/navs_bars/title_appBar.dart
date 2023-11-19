
import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';

 TitleAppBar(String title,BuildContext context) {
  return 
AppBar(
        title: Text(title),
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },

          
        ),
      );
}

