import 'package:LFS/constants/HomeSlider.dart';
import 'package:LFS/widget/HomeWidgets/Category.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2.0,
            shape: Border.all(
                width: 1.0, style: BorderStyle.solid, color: Colors.grey[200]),
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
