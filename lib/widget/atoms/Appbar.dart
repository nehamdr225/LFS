import 'package:LFS/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAppbar extends StatelessWidget {
  final heart;
  const FAppbar({Key key, this.heart: false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: lfsWhite,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.transparent ,
          ),
          onPressed: () {},
          splashColor: splash,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: primary,
            ),
            onPressed: () {},
            splashColor: splash,
          ),
          heart == true?
          IconButton(
            icon: Icon(
              CupertinoIcons.heart_solid,
              color: primary,
            ),
            onPressed: () {},
            splashColor: splash,
          ):
          Text('')
        ],
      ),
    );
  }
}
