import 'package:flutter/material.dart';

class FancyText extends StatelessWidget {
  final String text;
  final double size;
  final Color textColor;

  FancyText({this.text, this.textColor, this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue[900],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Text(text,
              style: TextStyle(
                fontFamily: 'Bree',
                fontSize: size,
                color: textColor,
              )),
        ),
      ),
    );
  }
}
