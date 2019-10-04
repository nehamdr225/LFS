import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/GoogleMaps.dart';
import 'package:LFS/widget/HomeWidgets/FollowAt.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/Carousel.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:LFS/state/merchants.dart';
//import 'package:LFS/widget/atoms/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String id;

  DetailPage({this.id});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final merchant = Provider.of<MerchantsModel>(context).one(widget.id);
    print(merchant);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        child: FAppbar(
          leadingChoice: false,
          heart: true,
        ),
        preferredSize: Size.fromHeight(40),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            // Carousel
            height: 300.0,
            child: FCarousel(asset: false, src: merchant['media']['src']),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Padding(
            // Name
            padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 2.0),
            child: FancyText(
              text: merchant['name'],
              textColor: textColor,
              textAlign: TextAlign.left,
              size: 22,
            ),
          ),
          Padding(
            // category
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 8.0),
            child: FancyText(
              text: merchant['category'].replaceAll(";", ", "),
              textColor: primary,
              fontFamily: 'Crimson',
              textAlign: TextAlign.start,
              size: 16,
            ),
          ),
          // Padding(
          //   // rating
          //   padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       Row(
          //         children: <Widget>[
          //           Chip(
          //             backgroundColor: Colors.yellow[700],
          //             label: Row(
          //               children: <Widget>[
          //                 Text('4.8'),
          //                 Icon(
          //                   Icons.star,
          //                   color: textColor,
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Padding(
          //             padding: EdgeInsets.all(2.0),
          //           ),
          //           FancyText(
          //             text: '55 people rated',
          //             size: 14.0,
          //             fontFamily: 'Crimson',
          //             textColor: textColor,
          //           ),
          //         ],
          //       ),
          //       FancyText(
          //         text: 'Read all reviews',
          //         size: 14.0,
          //         fontFamily: 'Crimson',
          //         textColor: textColor,
          //       )
          //     ],
          //   ),
          // ),

          // Container(
          //   height:100.0,
          //   child: Services()),
          Padding(
            // opening hours title
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 8.0),
            child: FancyText(
              text: 'Opening Hours',
              size: 16.0,
              textColor: textColor,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            // opening hours detail
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 8.0),
            child: FancyText(
              fontFamily: 'Crimson',
              text: '8am-12am',
              size: 16.0,
              textColor: primary,
              textAlign: TextAlign.start,
            ),
          ),

          Padding(
            // address title
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 8.0),
            child: FancyText(
              text: 'Address',
              size: 16.0,
              textColor: textColor,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            // address detail
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 8.0),
            child: FancyText(
              fontFamily: 'Crimson',
              text: merchant["address"],
              size: 16.0,
              textColor: primary,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
              height: 300.0,
              decoration: BoxDecoration(border: Border.all()),
              child: GoogleMaps(
                name: merchant["name"],
                location: merchant["location"],
              )),
          Padding(
            // address title
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 8.0, 8.0),
            child: FancyText(
              text: 'Contact Us',
              size: 16.0,
              textColor: textColor,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            // address detail
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 8.0),
            child: FancyText(
              fontFamily: 'Crimson',
              text: merchant['contact'],
              size: 16.0,
              textColor: textColor,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Follow(),
          ),
        ],
      ),
    );
  }
}
