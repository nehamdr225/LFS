import 'package:LFS/constants/HomeSlider.dart';
import 'package:LFS/widget/HomeWidgets/Category.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
import 'package:LFS/constants/colors.dart';

class HorizontalSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
            child: FancyText(text: '~~~  Exclusive Discounts  ~~~', textColor: primary, size: 20.0, textAlign: TextAlign.center,),
          ),
          HorizontalList(),
        ],
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2.0,
            shape: Border.all(width: 1.0, style: BorderStyle.solid, color: Colors.grey[200]),
            child: Category(
              name: Main[index]['name'],
              src: Main[index]['src'],
            ),
          );
        }, //
      ),
    );
  }
}