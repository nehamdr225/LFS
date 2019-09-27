import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/Carousel.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:LFS/state/merchants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final String name, id;
  DetailPage({this.name, this.id});
  @override
  Widget build(BuildContext context) {
    final merchant = Provider.of<MerchantsModel>(context).one(id);
    print(merchant);
    return Scaffold(
        appBar: PreferredSize(
          child: FAppbar(),
          preferredSize: Size.fromHeight(50),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 400,
              child: FCarousel(asset: false, src: merchant['media']['src']),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: FancyText(
                text: name,
                textColor: primary,
                textAlign: TextAlign.center,
                size: 32,
              ),
            ),
          ],
        ));
  }
}
