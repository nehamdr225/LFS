import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final image;
  final text;
  final height;
  final onTap;
  Cards({this.image, this.onTap, this.text, this.height = 200.0});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
        ),
        alignment: Alignment.center,
        height: height,
        width: screenWidth,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Bree',
            fontSize: 32.0,
          ),
        ),
      ),
    );
  }
}
