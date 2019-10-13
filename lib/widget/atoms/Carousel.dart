//import 'package:LFS/widget/Carousel.dart';
// import 'package:LFS/constants/colors.dart';
import 'package:LFS/constants/colors.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class FCarousel extends StatelessWidget {
  final asset;
  final List src;
  FCarousel(
      {this.src = const ['assets/images/categoryPics/lfsRestaurants.jpg'],
      this.asset = true});
  @override
  Widget build(BuildContext context) {
    // print(src);
    return Carousel(
      boxFit: BoxFit.cover,
      images: src
          .map((image) =>
              asset != true ? Image.network(image) : AssetImage(image))
          .toList(),
      animationCurve: Curves.ease,
      autoplay: true,
      dotSize: 6.0,
      overlayShadowColors: Color(0xff0d47a1),
      dotBgColor: Colors.transparent,
      indicatorBgPadding: 12.0,

      dotColor: lfsWhite,
      dotIncreasedColor: lfsWhite,
    );
  }
}
