import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FollowAt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Follow(),
        ],
      ),
    );
  }
}

class Follow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FancyText(
          text: 'Follow us at:',
          textAlign: TextAlign.start,
          textColor: primary,
          size: 16.0,
        ),
        InkWell(
          child: Image.asset('assets/images/SocialMedia/fb.png', height: 30.0, width: 30.0,),
        ),
        InkWell(
          child: Image.asset('assets/images/SocialMedia/insta.png', height: 30.0, width: 30.0,),
        ),
        InkWell(
          child: Image.asset('assets/images/SocialMedia/youtube.png', height: 30.0, width: 30.0,),
        ),
        InkWell(
          child: Image.asset('assets/images/SocialMedia/google.png', height: 30.0, width: 30.0,),
        )
      ],
    );
  }
}
