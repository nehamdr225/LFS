import 'package:LFS/pages/AccountPage.dart';
import 'package:LFS/pages/CategoryPage.dart';
import 'package:LFS/pages/HomePage.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/BottomNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int index = 1;
  final _pageOptions = [CategoryPage(), HomePage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: FAppbar(),
          preferredSize: Size.fromHeight(50),
        ),
        body: _pageOptions[index],
        bottomNavigationBar: BottomNavigation(
          index: index,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
        ));
  }
}
