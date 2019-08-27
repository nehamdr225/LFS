import 'package:flutter/material.dart';
import 'package:uno/widget/atoms/FText.dart';

class FLogo extends StatelessWidget {
  final String text;
  FLogo({this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          child: Text('LOGO HERE', style: TextStyle(fontSize: 24.0),),
        ),
        FText(text: text),
      ],
    );
  }
}