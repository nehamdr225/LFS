//import 'package:LFS/widget/Carousel.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class DetailsCarousel extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Carousel(
        boxFit: BoxFit.fill,
        images:[
          AssetImage('assets/images/categoryPics/lfsHotels.png'),
          AssetImage('assets/images/categoryPics/lfsRestaurants.jpg'),
          // AssetImage('images/heroimg1.jpeg'),
          // AssetImage('images/heroimg2.jpeg'),
          // AssetImage('images/heroimg3.jpeg'),
        ],
        animationCurve: Curves.ease,
        autoplay: false,
        dotSize: 6.0,
        overlayShadowColors: Color(0xff0d47a1),
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 12.0,
    );
  }
}


