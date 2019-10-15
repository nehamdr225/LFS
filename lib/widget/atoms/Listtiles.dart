import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class Listtiles extends StatelessWidget {
  final image;
  final text;
  final height;
  final onTap;
  final width;
  final margin;
  final fontSize;
  Listtiles(
      {this.image,
      this.onTap,
      this.text,
      this.height = 200.0,
      this.width,
      this.margin: 0.0,
      this.fontSize: 32.0});
  @override
  Widget build(BuildContext context) {
    return Card(
          child:  Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
              width: 300.0,
              height: 150.0,
              child: ListTile(
                title:
                    Image.asset(
                    image,
                        width: width,
                        height: height,
                      ),
                   
                contentPadding: EdgeInsets.all(1.0),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Bree', fontSize: fontSize, color: primary),
                  ),
                ),
              )),
        ))
    );
  }
}