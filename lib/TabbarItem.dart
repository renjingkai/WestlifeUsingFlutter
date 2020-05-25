import 'package:flutter/material.dart';

class TabbarItem extends StatelessWidget {
  final title;
  final Color color;

  // var inaaa;
  TabbarItem(this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: Text(
        title,
        style:
            TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18),
        textAlign: TextAlign.right,
      ),
    );
  }
}