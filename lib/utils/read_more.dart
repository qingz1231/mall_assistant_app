import 'package:flutter/material.dart';

class ReadMore extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;

  ReadMore(this.text, this.maxLines, {required this.style});

  @override
  _ReadMoreState createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          textAlign:TextAlign.justify,
          widget.text,
          style: widget.style,
          maxLines: isExpanded ? null : widget.maxLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        InkWell(
          child: Text(
            
            isExpanded ? 'See Less' : 'See More',
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
      ],
    );
  }
}