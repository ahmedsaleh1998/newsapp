import 'package:flutter/material.dart';

class textTheme extends StatelessWidget {
  final String text;
  final double textsize;
  final Color textcolor;
  final bool wight;
  textTheme({this.text, this.textsize, this.textcolor, this.wight});
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          fontSize: textsize,
          fontWeight: wight == true ? FontWeight.bold : FontWeight.normal,
          color: textcolor),
    );
  }
}
