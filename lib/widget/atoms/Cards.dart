import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final image;
  final text;
  final height;
  final onTap;
  final width;
  final margin;
  final fontSize;
  Cards(
      {this.image,
      this.onTap,
      this.text,
      this.height = 200.0,
      this.width,
      this.margin: 0.0,
      this.fontSize: 32.0});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0 ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.solid,
              color: Colors.black38,
              width: 3.0
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset.fromDirection(1, 2),
                  blurRadius: 1),
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset.fromDirection(-1, 2),
                  blurRadius: 1)
            ],
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
          ),
          alignment: Alignment.center,
          height: height,
          width: width != null ? width : MediaQuery.of(context).size.width,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Bree',
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
