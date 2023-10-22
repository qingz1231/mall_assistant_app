import 'package:flutter/material.dart';
class TitleDesc extends StatelessWidget {
  final String title;
  final String description;

  TitleDesc({required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    return Container(
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                  children: [
                     Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),
                      ),

                      Text(
                        description,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),
                      ),
                  ],
                ),
              )
;
  }
}