import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  const appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: men,
      title: Row(
        children: [

        ]
        ),
    );
  }
   @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}