import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/SearchPage.dart';
import 'package:LFS/widget/atoms/FLogo.dart';
//import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAppbar extends StatelessWidget {
  final heart;
  final leadingChoice;
  final search;
  final searchBar;
  const FAppbar(
      {Key key,
      this.leadingChoice: true,
      this.search: true,
      this.heart: false,
      this.searchBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: lfsWhite,
      leading: leadingChoice == true
          ? FLogo()
          : IconButton(
              icon: Icon(
                CupertinoIcons.back,
                color: primary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      title: searchBar != null
          ? TextField(
              autofocus: true,
              onChanged: (String h) {
                print(h);
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  hintText: "Find offers and discounts!",
                  hintStyle: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 12,
                      color: Colors.black54),
                  // labelStyle: ,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primary))),
            )
          : null,
      actions: <Widget>[
        search == true
            ? IconButton(
                icon: Icon(
                  Icons.search,
                  color: primary,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                splashColor: splash,
              )
            : Text(' '),
        heart == true
            ? IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: primary,
                ),
                onPressed: () {},
                splashColor: splash,
              )
            : Text('')
      ],
    );
  }
}
