import 'package:LFS/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Services extends StatelessWidget {
  Services(
      {this.freeWifi: true,
      this.ac: true,
      this.tv: true,
      this.parking: true,
      this.contact});
  final bool freeWifi, ac, tv, parking;
  final contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        freeWifi
            ? Column(children: [
                Icon(Icons.wifi),
                Text(
                  'WiFi',
                  style: TextStyle(color: textColor),
                )
              ])
            : Text(''),
        ac
            ? Column(children: [
                Icon(Icons.ac_unit),
                Text(
                  'AC',
                  style: TextStyle(color: textColor),
                )
              ])
            : Text(''),
        tv
            ? Column(children: [
                Icon(Icons.tv),
                Text(
                  'TV',
                  style: TextStyle(color: textColor),
                )
              ])
            : Text(''),
        parking
            ? Column(children: [
                Icon(Icons.local_parking),
                Text(
                  'Parking',
                  style: TextStyle(color: textColor),
                )
              ])
            : Text(''),
        IconButton(
          onPressed: () async {
            final url = 'tel://$contact';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              print('Could not launch $url');
            }
          },
          color: primary,
          icon: Icon(
            Icons.call,
            size: 28.0,
          ),
          tooltip: "Call us Now",
        ),
      ],
    );
  }
}
