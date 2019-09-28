import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/GoogleMaps.dart';
import 'package:LFS/widget/HomeWidgets/FollowAt.dart';
import 'package:LFS/widget/atoms/RateUs.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/Carousel.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:LFS/state/merchants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String name, id;
  
  DetailPage({this.name, this.id});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    final merchant = Provider.of<MerchantsModel>(context).one(widget.id);
    print(merchant);
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          child: FAppbar(
            heart: true,
          ),
          preferredSize: Size.fromHeight(50),
        ),
        body: ListView(
          children: <Widget>[
            Container( // carousel
              height: 400.0,
              color: Colors.white,
              child: FCarousel(asset: false, src: merchant['media']['src']),
            ),
            Container( //name
              height: 200.0,
              color: Colors.white,
              padding: EdgeInsets.all(2),
              child: FancyText(
                text: widget.name,
                textColor: primary,
                textAlign: TextAlign.center,
                size: 32,
              ),
            ),
            Container( // category
              height: 200.0,
              color: Colors.white,
              padding: EdgeInsets.all(2),
              child: FancyText(
                text: merchant['categories'],
                fontFamily: 'Crimson',
                textColor: primary,
                textAlign: TextAlign.center,
                size: 32,
              ),
            ),
            Container( //Sale details
              height: 200.0,
              color: Colors.white,
              padding: EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  FancyText(
                    text: 'Flash Sale 10%',
                    textColor: primary,
                    textAlign: TextAlign.center,
                    size: 32,
                  ),
                  FancyText(
                    text:
                        'Receive 10% off with LFS card, (Place for merchant details)',
                    fontFamily: 'Crimson',
                    textColor: primary,
                    textAlign: TextAlign.center,
                    size: 32,
                  ),
                  RateUs(),                  
                ],
              ),
            ),
            Container( //Services details
              //height: 200.0,
              color: Colors.white,
              padding: EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  FancyText(
                    text: 'Services',
                    //fontFamily: 'Crimson',
                    textColor: primary,
                    textAlign: TextAlign.center,
                    size: 32,
                  ),
                  FancyText(
                    text: '- Free Wifi\n- Live Music\n- AC',
                    fontFamily: 'Crimson',
                    textColor: primary,
                    textAlign: TextAlign.center,
                    size: 32,
                  ),
                ],
              ),
            ),
            Container( // Google Maps
              child: GoogleMaps(),
            ),
            Container( // reviews
              height: 300.0,
              child: FancyText(
                text: 'Reviews',
              ),
            ),
            Follow(),
          ],
        ));
  }
}
