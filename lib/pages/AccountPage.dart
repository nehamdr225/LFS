import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/HomeWidgets/AppBarPage.dart';
//import 'package:LFS/widget/HomeWidgets/AppBarPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AccountPage extends StatelessWidget {
  final image;
  AccountPage({this.image});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBarPage(
            bgcolor: Colors.white,
            elevation: 0.0,
            select: false,
            search: false,
          ),
        ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: 100.0,
              width: screenWidth,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: secondary,
                    child: Text('LFS',
                        style:
                            TextStyle(fontFamily: 'Bree', color: Colors.white)),
                    //child: Image.asset(image,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, color: primary),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    onPressed: () {},
                    child: Text('Login / Signup',
                        style: TextStyle(fontFamily: 'Bree', color: primary)),
                    //child: Image.asset('assets/images/SocialMedia/merchantFAB.png', height: 30.0, width: 30.0,),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
          ),
          Container(
            height: 20.0,
            child: ListTile(
              leading: Icon(
                CupertinoIcons.heart,
                color: primary,
              ),
              title: Text(
                'Rate us',
                style: TextStyle(color: primary, fontFamily: 'Crimson'),
              ),
              trailing: Icon(
                CupertinoIcons.right_chevron,
                color: primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
          ),
          Container(
            height: 20.0,
            child: ListTile(
              leading: Icon(
                CupertinoIcons.heart_solid,
                color: primary,
              ),
              title: Text(
                'Like',
                style: TextStyle(color: primary, fontFamily: 'Crimson'),
              ),
              trailing: Icon(
                CupertinoIcons.right_chevron,
                color: primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
          ),
          Container(
            height: 20.0,
            child: ListTile(
              leading: Icon(
                CupertinoIcons.share_solid,
                color: primary,
              ),
              title: Text(
                'Share',
                style: TextStyle(color: primary, fontFamily: 'Crimson'),
              ),
              trailing: Icon(
                CupertinoIcons.right_chevron,
                color: primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
