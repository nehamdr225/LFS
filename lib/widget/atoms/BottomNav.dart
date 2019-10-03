import 'package:LFS/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final index;
  final Function onTap;
  BottomNavigation({this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    const helvetica = TextStyle(fontFamily: 'Helvetica');
    return Container(
      child: BottomNavigationBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        selectedItemColor: primary,
        selectedIconTheme: IconThemeData(color: primary),
        unselectedIconTheme: IconThemeData(color: secondary),
        unselectedItemColor: secondary,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(
              'Category',
              style: helvetica,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: helvetica,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: Text(
              'Account',
              style: helvetica,
            ),
          ),
        ],
      ),
    );
  }
}
