import 'package:flutter/material.dart';


class HighlightTile extends StatelessWidget {
  String title;
  String imgUrl;
  HighlightTile({required this.title,required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20),
          color: Colors.black
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
        
        )),
      ),
    );
  }
}
class GridScroll extends StatelessWidget {
  const GridScroll({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return HighlightTile(title: "testing", imgUrl: "https://mall-assistant-system.s3.amazonaws.com/1x1.jpg");
        },
      ),
    );
  }
}
