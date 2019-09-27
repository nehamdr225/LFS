import 'package:LFS/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final index;
  final Function onTap;
  BottomNavigation({this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: IconTheme(
              child: Icon(Icons.category),
              data: IconThemeData(color: primary),
            ),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: IconTheme(
              child: Icon(Icons.home),
              data: IconThemeData(color: primary),
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: IconTheme(
              child: Icon(CupertinoIcons.profile_circled),
              data: IconThemeData(
                color: primary,
              ),
            ),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
