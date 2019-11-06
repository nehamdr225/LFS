import 'package:flutter/material.dart';

class FancyText extends StatelessWidget {
  final String text;
  final double size;
  final Color textColor;
  final TextAlign textAlign;
  final fontFamily;
  final onTap;

  FancyText(
      {this.text,
      this.textAlign,
      this.textColor,
      this.size,
      this.fontFamily: 'Bree',
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue[900],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: size,
              color: textColor,
            ),
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}
