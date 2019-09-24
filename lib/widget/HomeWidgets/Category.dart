import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final network;
  final String src;
  final caption;
  final String name;
  final height;
  final width;

  Category(
      {this.caption,
      this.src,
      this.name,
      this.network = false,
      this.height = 150.0,
      this.width = 150.0});

  @override
  Widget build(BuildContext context) {
    if (network != false)
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
                width: width,
                child: ListTile(
                  title: network != null
                      ? Image.network(
                          network,
                          width: width,
                          height: height,
                        )
                      : Text("N/A"),
                  contentPadding: EdgeInsets.all(1.0),
                  subtitle: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Bree', fontSize: 15.0, color: primary),
                    ),
                  ),
                )),
          ));
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
                title: src != null
                    ? Image.asset(
                        src,
                        width: 150.0,
                        height: 150.0,
                      )
                    : Text("N/A"),
                contentPadding: EdgeInsets.all(1.0),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Bree', fontSize: 15.0, color: primary),
                  ),
                ),
              )),
        ));
  }
}
