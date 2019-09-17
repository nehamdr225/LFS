import 'package:LFS/constants/colors.dart';
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
            //);
          },
          child: Container(
            width: 150.0,
              child: ListTile(
                title: Image.asset(
                  src,
                  width: 150.0,
                  height: 150.0,
                ),
                contentPadding: EdgeInsets.all(1.0),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Bree', fontSize: 15.0, color: primary),
                  ),
                ),
              )),
        ));
  }
}
