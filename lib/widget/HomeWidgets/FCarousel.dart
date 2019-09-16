import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class FCarousel extends StatelessWidget {
  // final List <AssetImage> images;
  // FCarousel({this.images});
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: 350.0 ,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/images/one.jpg'),
          AssetImage('assets/images/two.jpg'),
          AssetImage('assets/images/three.jpg'),
        ],
        animationCurve: Curves.ease,
        autoplay: true,
        animationDuration: Duration(seconds: 1),
        dotSize: 6.0,
        overlayShadowColors: Color(0xff0d47a1),
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 12.0,
      ),
    );
  }
}
