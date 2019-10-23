import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/SearchPage.dart';
import 'package:LFS/state/user.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FAppbar extends StatelessWidget {
  final heart, leadingChoice, search, searchBar, title, searchController, id;

  const FAppbar({
    Key key,
    this.leadingChoice: true,
    this.search: true,
    this.heart: false,
    this.searchBar,
    this.title,
    this.searchController,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);

    final snackBar = (text, label, onPressed) => SnackBar(
          backgroundColor: deepBlue,
          duration: Duration(seconds: 2),
          content: Text(text, style: TextStyle(fontSize: 16)),
          action: SnackBarAction(
            label: label,
            textColor: Colors.white,
            onPressed: onPressed,
          ),
        );
    void addToFavourites() {
      final status = user.favourite(id);
      final removeFromFavs = (ids) => user.removeFromFav(ids);
      /* Show snackbar containing error message in Scaffold! */
      if (status == "error") {
        Scaffold.of(context).showSnackBar(snackBar(
            "Already in favourites!", "Remove", () => removeFromFavs([id])));
      } else {
        Scaffold.of(context).showSnackBar(snackBar(
            "Added item to favourites!", "Undo", () => removeFromFavs([id])));
      }
    }

    return AppBar(
      elevation: 0.0,
      backgroundColor: lfsWhite,
      centerTitle: true,
      leading: leadingChoice == true
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 3.0),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logopetals.png',
                fit: BoxFit.fill,
              ),
            )
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
              onChanged: (value) {
                searchController(value);
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
          : title != null
              ? Text(
                  title,
                  style: TextStyle(
                      color: primary, fontFamily: "Helvetica", fontSize: 16),
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
                onPressed: addToFavourites,
                splashColor: splash,
              )
            : Text('')
      ],
    );
  }
}
