import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final image;
  final text;
  final height;
  final onTap;
  Cards({this.image,this.onTap, this.text, this.height = 200.0});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: InkWell(
        onTap: onTap,
          child: Stack(
            children: <Widget>[
              Image.asset(
                image,
                width: screenWidth,
                //height: 200.0,
              ),
              Container(
                alignment: Alignment.center,
                height: height,
                width: screenWidth,
                color: Colors.black38,
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Bree',
                    fontSize: 32.0,
                  ),
                ),
              ),
            ],
          
        ),
      ),
    );
  }
}
