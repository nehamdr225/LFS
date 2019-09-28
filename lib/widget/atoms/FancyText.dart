import 'package:flutter/material.dart';

class FancyText extends StatelessWidget {
  final String text;
  final double size;
  final Color textColor;
  final TextAlign textAlign;
  final fontFamily;

  FancyText({this.text, this.textAlign, this.textColor, this.size, this.fontFamily:'Bree'});
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue[900],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Text(text,
              style: TextStyle(
                fontFamily: fontFamily,
                fontSize: size,
                color: textColor,
              ),
              textAlign: textAlign,),
        ),
      ),
    );
  }
}
