import 'package:LFS/widget/HomeWidgets/AppBarPage.dart';
import 'package:LFS/widget/HomeWidgets/FCarousel.dart';
import 'package:LFS/widget/HomeWidgets/MenuBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBarPage(),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            MenuBar(),
            Container(
              height: 350.0,
              child: FCarousel()
            ),
          ],
        )
      ),
      
    );
  }
}