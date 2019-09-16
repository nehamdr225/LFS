import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String src;
  final caption;
  final String name;

  Category({this.caption, this.src, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => CategoryPage(text: name),
            //   ),
            // );
          },
          child: Container(
            height: 200.0,
            width: 300.0,
              child: Stack(
                children: <Widget>[
                  Image.asset(src),
                  Container(
                    color: Colors.black12,
                  ),
                  FancyText(
                    text: name,
                    textColor: Colors.white,
                  )
                ],
              ),
          ),
        ));
  }
}
