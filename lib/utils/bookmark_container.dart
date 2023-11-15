import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/utils/title_desc.dart';

import '../ui/shop_detail.dart';
import 'customButton.dart';
import 'icon_btn.dart';

class BookmarkContainer extends StatefulWidget {
  final String title;
  final String description;
  bool clicked;
  final String id;
  final Function(bool saved)? onTapFunction;

  BookmarkContainer(
      {required this.title,
      required this.description,
      required this.clicked,
      required this.onTapFunction,
      required this.id});

  @override
  _BookmarkContainerState createState() => _BookmarkContainerState();
}

class _BookmarkContainerState extends State<BookmarkContainer> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return isVisible
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopDetail(itemId: widget.id),
                  ),
                );
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: txt2), color: txt3),
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
                          mainAxisSize: MainAxisSize
                              .min, // Set this to occupy available vertical space
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                widget.title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: txt_large,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                widget.description,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: txt_medium,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.15,
                                    child: CustomIconBtn(
                                        height: screenWidth * 0.3 / 3,
                                        icon: Icons.add,
                                        clicked: widget.clicked,
                                        onTapFunction: (bool saved) async {
                                          widget.onTapFunction!(widget.clicked);
                                          if (widget.clicked) {
                                            setState(() {
                                              isVisible = false;
                                            });
                                          }
                                        }),
                                  ),
                                  // Container(
                                  //   width: screenWidth * 0.15,
                                  //   child: CustomCircularButton(
                                  //      screenWidth * 0.3/3, Icons.thumb_down, () => null),
                                  // ),
                                ],
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
          )
        : SizedBox.shrink();
  }
}
