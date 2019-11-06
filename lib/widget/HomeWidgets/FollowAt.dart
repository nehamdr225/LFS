import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Follow extends StatelessWidget {
  final String fontFamily;
  Follow({this.fontFamily:'Helvetica'});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FancyText(
          text: 'Follow us',
          textAlign: TextAlign.start,
          textColor: primary,
          size: 18.0,
          fontFamily: fontFamily,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: _launchURL,
              child: Image.asset(
                'assets/images/SocialMedia/fb.png',
                height: 30.0,
                width: 30.0,
              ),
            ),
            InkWell(
              child: Image.asset(
                'assets/images/SocialMedia/insta.png',
                height: 30.0,
                width: 30.0,
              ),
            ),
            InkWell(
              child: Image.asset(
                'assets/images/SocialMedia/youtube.png',
                height: 30.0,
                width: 30.0,
              ),
            ),
            InkWell(
              child: Image.asset(
                'assets/images/SocialMedia/google.png',
                height: 30.0,
                width: 30.0,
              ),
            )
          ],
        )
      ],
    );
  }
}

_launchURL() async {
  const url = 'https://facebook.com/LFS-card-105008720895276/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
