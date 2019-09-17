import 'package:LFS/widget/HomeWidgets/CircleOpts.dart';
import 'package:LFS/widget/HomeWidgets/FollowAt.dart';
import 'package:LFS/widget/HomeWidgets/HorizontalSlider.dart';
import 'package:LFS/widget/HomeWidgets/lfsCarouselSlider.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              flexibleSpace: CarouselSlide(),
              backgroundColor: Colors.blue,
              floating: true,
              expandedHeight: 450.0,
              leading: Icon(Icons.arrow_back, color: Colors.transparent,),
            ),
            
            CircleOpts(),
            
            Container(
              child: HorizontalSlider(),
            ),
            FollowAt()


          ],
        ),
      ),
    );
  }
}