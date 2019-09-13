import 'package:flutter/material.dart';

class FIcon extends StatelessWidget {
  final IconData icon;
  final onPressed;
  FIcon({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      child: Icon(icon, color: Colors.blue[900],),
    );
  }
}