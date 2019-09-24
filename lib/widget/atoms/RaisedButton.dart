import 'package:flutter/material.dart';

class FRaisedButton extends StatelessWidget {
  final String text;
  final height;
  final width;
  final Function onPressed;
  final Color color, bg;
  final shape;
  FRaisedButton({this.text, this.shape, this.onPressed, this.color, this.bg, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
          color: bg,
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontFamily: 'Bree',
              fontSize: 18.0,
            ),
          ),
          shape: shape != null
          ? 
          Border.all(width: 0.0, color: Colors.black38)
          :
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          onPressed: onPressed
      ),
    );
  }
}