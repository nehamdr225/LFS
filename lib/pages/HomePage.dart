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
              expandedHeight: 400.0,
              leading: Icon(
                Icons.arrow_back,
                color: Colors.transparent,
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                      elevation: 5.0,
                      heroTag: 'Search',
                      backgroundColor: Colors.black45,
                      onPressed: () {},
                      child: Icon(Icons.search, color: Colors.white)),
                ),
              ],
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(12.0),
            )),
            CircleOpts(),
            Container(
              child: HorizontalSlider(),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(12.0),
            )),
            FollowAt(),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(12.0),
            )),
          ],
        ),
      ),
    );
  }
}
