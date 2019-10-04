import 'package:LFS/constants/colors.dart' ;
import 'package:LFS/widget/HomeWidgets/CircleOpts.dart';
import 'package:LFS/widget/HomeWidgets/FollowAt.dart';
import 'package:LFS/widget/HomeWidgets/HorizontalSlider.dart';
import 'package:LFS/widget/atoms/Carousel.dart';
import 'package:LFS/widget/atoms/FancyText.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            height: 400,
            child: FCarousel(asset: true, src: [
              'assets/images/FeaturedPhotos/DiningPark.jpg',
              //'assets/images/FeaturedPhotos/HotelImperialPics.jpg'
              'assets/images/FeaturedPhotos/TimesSquareRestro.PNG'
            ])),
            Padding(padding: EdgeInsets.all(8.0),),
        Options(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FancyText(
            text: 'Near You',
            textColor: textColor,
            fontFamily: 'Bree',
            size: 20.0,
          ),
        ),
        Container(
          child: HorizontalList(),
        ),
        Padding(padding: EdgeInsets.all(8.0),),
        Follow(),
      ],
    );
  }
}
