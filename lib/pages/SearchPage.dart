import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final style = TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: primary);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
          search: false,
          searchBar: true,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 20, right: 20), child: Text("HI")),
        ],
      ),
    );
  }
}
