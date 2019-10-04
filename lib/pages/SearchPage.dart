// import 'package:LFS/constants/colors.dart'
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
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              autofocus: true,
              onChanged: (String h) {
                print(h);
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 12,
                      color: Colors.black54),
                  // labelStyle: ,
                  labelText: "Search",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primary))),
            ),
          ),
        ],
      ),
    );
  }
}
