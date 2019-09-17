import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/AccountPage.dart';
import 'package:LFS/pages/CategoryPage.dart';
import 'package:LFS/pages/HomePage.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedPage = 1;
  final _pageOptions = [CategoryPage(), HomePage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
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
              child: Icon(Icons.account_circle),
              data: IconThemeData(color: primary),
            ),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
