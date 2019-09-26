import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/carousel/OverlayCarousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              flexibleSpace: OverlayCarousel(),
              backgroundColor: primary,
              floating: true,
              expandedHeight: 300.0,
              leading: FloatingActionButton(
                child: Icon(CupertinoIcons.back),
                backgroundColor: Colors.black45,
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                      elevation: 5.0,
                      heroTag: 'Search',
                      backgroundColor: Colors.black45,
                      onPressed: () {},
                      child: Icon(CupertinoIcons.search, color: Colors.white)),
                ),
              ],
            ),
          ]));
  }
}