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
        selectedItemColor: primary,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.category, color: primary),
            icon: Icon(Icons.category, color: secondary,),
            title: Text('Category', style: TextStyle(fontFamily: 'Helvetica'),),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: primary),
            icon: Icon(Icons.home, color: secondary,),

            title: Text('Home',style: TextStyle(fontFamily: 'Helvetica'),),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.profile_circled, color: primary),
            icon: Icon(CupertinoIcons.profile_circled, color: secondary,),
            
            title: Text('Account', style: TextStyle(fontFamily: 'Helvetica'),),
          ),
        ],
      ),
    );
  }
}
