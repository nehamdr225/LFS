import 'package:LFS/widget/HomeWidgets/CircleOpts.dart';
import 'package:LFS/widget/HomeWidgets/FollowAt.dart';
import 'package:LFS/widget/HomeWidgets/HorizontalSlider.dart';
import 'package:LFS/widget/atoms/Carousel.dart';

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
              'assets/images/categoryPics/lfsHotels.png',
              'assets/images/categoryPics/lfsRestaurants.jpg'
            ])),
        Options(),
        Container(
          child: HorizontalList(),
        ),
        Follow(),
      ],
    );
  }
}
