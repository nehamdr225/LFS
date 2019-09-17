//import 'package:LFS/widget/Carousel.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselSlide extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Carousel(
        boxFit: BoxFit.fitWidth,
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


//CarouselSlider(
  //     items: [
  //       'assets/images/categoryPics/lfsHotels.jpg',
  //       'assets/images/categoryPics/lfsRestaurants.jpg',
  //       'assets/images/categoryPics/lfsShoppingMall.jpg',
  //       'assets/images/categoryPics/lfsMovieHall.jpg',
  //     ].map((i) {
  //   return Builder(
  //     builder: (BuildContext context) {
  //       return Container(
  //         width: MediaQuery.of(context).size.width,
  //         margin: EdgeInsets.symmetric(horizontal: 5.0),
  //         decoration: BoxDecoration(
  //           image: DecorationImage(
              
  //             image: AssetImage("assets/images/categoryPics/lfsHotels.jpg")
  //           ),
  //           color: Colors.amber
  //         ),
  //         child: Text('text $i', style: TextStyle(fontSize: 16.0),)
  //       );
  //     },
  //   );
  // }).toList(),
  //     height: 400,
  //     aspectRatio: 16 / 9,
  //     viewportFraction: 0.8,
  //     initialPage: 0,
  //     enableInfiniteScroll: true,
  //     reverse: false,
  //     autoPlay: true,
  //     autoPlayInterval: Duration(seconds: 3),
  //     autoPlayAnimationDuration: Duration(milliseconds: 800),
  //     //autoPlayCurve: Curve.ease ,
  //     pauseAutoPlayOnTouch: Duration(seconds: 10),
  //     enlargeCenterPage: true,
  //     //onPageChanged: callbackFunction,
  //     scrollDirection: Axis.horizontal,
  //   );
