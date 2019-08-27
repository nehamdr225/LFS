import 'package:flutter/material.dart';

class FText extends StatelessWidget {
  final String text;
  FText({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(fontSize: 18,), textAlign: TextAlign.center,),
    );
  }
}