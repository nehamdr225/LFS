import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';

class FAppbar extends StatelessWidget {
  const FAppbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: lfsWhite,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: primary,
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
        ],
      ),
    );
  }
}
