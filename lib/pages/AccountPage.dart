import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:LFS/widget/atoms/RateUs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';
//import 'package:LFS/state/user.dart';

class AccountPage extends StatelessWidget {
  final image;
  AccountPage({this.image});
  @override
  Widget build(BuildContext context) {
    // final Map<String, dynamic> merchant =
    //     Provider.of<UserModel>(context).user;
    return Column(
      children: <Widget>[
        Image.asset('assets/images/logopetals.png'),
        FancyText(
          text: 'LFS Card',
          textAlign: TextAlign.center,
          textColor: textColor,
          size: 24.0,
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
        ),
        Row( // Circular Avatar
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(12.0),),
            CircleAvatar(
              radius: 24.0,
              backgroundColor: Colors.grey[200],
              child: Text(
                'N',
                style: TextStyle(
                    fontFamily: 'Bree', fontSize: 20.0, color: primary),
              ), //put initials of a user insted of 'N'
            ),
            Padding(padding: EdgeInsets.all(12.0),),            
            Text(
              'Name',
              style:
                  TextStyle(fontFamily: 'Bree', fontSize: 20.0, color: primary),
            ), //put full name of a user insted of 'Name'
          ],
        ),
        // FlatButton(
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(width: 1.0, color: buttonColor),
        //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //   ),
        //   onPressed: () {},
        //   child: Text('Login / Signup',
        //       style: TextStyle(fontFamily: 'Bree', color: buttonColor)),

        // ),
        Padding(
          padding: EdgeInsets.all(12.0),
        ),
        Container(
          height: 20.0,
          child: ListTile(
            leading: Icon(
              Icons.bookmark,
              color: buttonColor,
            ),
            title: Text(
              'Favourites',
              style: TextStyle(color: textColor, fontFamily: 'Crimson'),
            ),
            trailing: Icon(
              CupertinoIcons.right_chevron,
              color: buttonColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
        ),
        Container(
          height: 20.0,
          child: ListTile(
            leading: Icon(
              Icons.star,
              color: buttonColor,
            ),
            title: Text(
              'Rate us',
              style: TextStyle(color: textColor, fontFamily: 'Crimson'),
            ),
            trailing: Icon(
              CupertinoIcons.right_chevron,
              color: buttonColor,
            ),
            onTap: () {
              AlertDialog(
                elevation: 2.0,
                title: FancyText(
                  text: 'Rate Us',
                  textColor: primary,
                  size: 18.0,
                ),
                actions: <Widget>[RateUs()],
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
        ),
        Container(
          height: 20.0,
          child: ListTile(
            leading: Icon(
              Icons.thumb_up,
              color: buttonColor,
            ),
            title: Text(
              'Like',
              style: TextStyle(color: textColor, fontFamily: 'Crimson'),
            ),
            trailing: Icon(
              CupertinoIcons.right_chevron,
              color: buttonColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
        ),
        Container(
          height: 20.0,
          child: ListTile(
            leading: Icon(
              CupertinoIcons.share_solid,
              color: buttonColor,
            ),
            title: Text(
              'Share',
              style: TextStyle(color: textColor, fontFamily: 'Crimson'),
            ),
            trailing: Icon(
              CupertinoIcons.right_chevron,
              color: buttonColor,
            ),
          ),
        )
      ],
    );
  }
}
