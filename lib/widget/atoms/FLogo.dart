import 'package:flutter/material.dart';
//import 'package:LFS/widget/atoms/FText.dart';

class FLogo extends StatelessWidget {
  final String text;
  final height;
  final width;
  FLogo({this.text, this.height:50.0, this.width:60.0});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          alignment: Alignment.topCenter,
          child: Image.asset('assets/images/logo.png', height: height, width: width,)
        ),
        //FText(text: text),
      ],
    );
  }
}