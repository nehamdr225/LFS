import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/Carousel.dart';
import 'package:LFS/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:LFS/widget/HomeWidgets/FollowAt.dart';
import 'package:geolocator/geolocator.dart';
import 'package:LFS/widget/GoogleMaps.dart';
import 'package:LFS/state/merchants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final String id;
  DetailPage({this.id});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var distance = "N/A";
  Future<Position> getPosition() async => await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  Future<double> getDistance(Position user, List merchant) async =>
      await Geolocator().distanceBetween(user.latitude, user.longitude,
          double.parse(merchant[0]), double.parse(merchant[1])) /
      1000;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> merchant =
        Provider.of<MerchantsModel>(context).one(widget.id);

    if (merchant["location"].isNotEmpty && merchant["location"] != null)
      getPosition().then(
        (Position data) => getDistance(data, merchant["location"]).then(
          (double dist) {
            if (dist.toString() != distance)
              setState(() {
                distance = dist.toString();
              });
          },
        ),
      );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        child: FAppbar(
            leadingChoice: false,
            heart: true,
            title: merchant["name"],
            id: widget.id),
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
          Padding(
              // category
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 8.0),
              child: Row(children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: deepBlue,
                ),
                FancyText(
                  text: distance != "N/A"
                      ? "${double.parse(distance).toStringAsFixed(2)} km"
                      : distance,
                  textColor: textColor,
                  fontFamily: 'Crimson',
                  textAlign: TextAlign.start,
                  size: 16,
                ),
              ])),
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
            child: Row(
              children: [
                Icon(
                  Icons.timer,
                  size: 16,
                  color: deepBlue,
                ),
                FancyText(
                  text: "8 am - 12 pm",
                  textColor: textColor,
                  fontFamily: 'Crimson',
                  textAlign: TextAlign.start,
                  size: 16,
                ),
              ],
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
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: deepBlue,
                  ),
                  FancyText(
                    text: merchant["address"],
                    textColor: textColor,
                    fontFamily: 'Crimson',
                    textAlign: TextAlign.start,
                    size: 16,
                  ),
                ],
              )),
          Container(
              height: merchant["location"] != null &&
                      merchant["location"].isNotEmpty
                  ? 300.0
                  : 0.0,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset.fromDirection(1, 2),
                    blurRadius: 1),
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset.fromDirection(-1, 2),
                    blurRadius: 1)
              ]),
              child: merchant["location"] != null &&
                      merchant["location"].isNotEmpty
                  ? GoogleMaps(
                      name: merchant["name"],
                      location: merchant["location"],
                    )
                  : Text("")),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                // address detail
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.call,
                      size: 16,
                      color: deepBlue,
                    ),
                    FancyText(
                      text: merchant["contact"],
                      textColor: textColor,
                      fontFamily: 'Crimson',
                      textAlign: TextAlign.start,
                      size: 16,
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () async {
                  final url = 'tel://${merchant["contact"]}';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    print('Could not launch $url');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.call),
                    Text(
                      "Call now",
                      style: TextStyle(fontFamily: "Helvetica"),
                    ),
                  ],
                ),
              )
            ],
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
