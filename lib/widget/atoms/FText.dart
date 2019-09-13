import 'package:flutter/material.dart';

class FText extends StatelessWidget {
  final String text;
  final String font;
  FText({this.text, this.font});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: font,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
