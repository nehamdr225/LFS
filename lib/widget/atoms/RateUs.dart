import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RateUs extends StatefulWidget {
  @override
  _RateUsState createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
                    children: [
                      FancyText(
                        text: 'Rate us',
                        size: 24.0,
                        textAlign: TextAlign.center,
                        textColor: primary,
                      ),
                      SmoothStarRating(
                          allowHalfRating: true,
                          onRatingChanged: (v) {
                            rating = v;
                            setState(() {});
                          },
                          starCount: 5,
                          rating: rating,
                          size: 28.0,
                          color: Colors.yellow[700],
                          borderColor: Colors.black45,
                          spacing: 0.0)
                    ],
                  );
  }
}