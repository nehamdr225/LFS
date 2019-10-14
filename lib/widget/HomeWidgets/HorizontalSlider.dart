import 'package:LFS/constants/categories.dart';
import 'package:LFS/pages/NearYouPage.dart';
import 'package:LFS/widget/atoms/Cards.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        width: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: CATEGORIES
              .map(
                (category) => Cards(
                  image: category["image"],
                  text: category["name"],
                  height: 200.0,
                  width: 150.0,
                  margin: 5.0,
                  fontSize: 28.0,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NearYouPage(type: category["type"])),
                    );
                  },
                ),
              )
              .toList(),
        ));

    // Container(
    //   height: 200.0,
    //   width: 150.0,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: 7,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Card(
    //         elevation: 2.0,
    //         shape: Border.all(
    //             width: 1.0, style: BorderStyle.solid, color: Colors.grey[200]),
    //         child: Category(
    //           name: Main[index]['name'],
    //           src: Main[index]['src'],
    //         ),
    //       );
    //     }, //
    //   ),
    // );
  }
}
