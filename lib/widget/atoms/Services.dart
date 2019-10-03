import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  Services({this.freeWifi: true, this.ac:true, this.tv:true, this.parking:true});
  final bool  freeWifi;
  final bool ac;
  final bool tv;
  final bool parking;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,   
      children: <Widget>[
        freeWifi== true
        ? Icon(Icons.wifi)
        : Text(''),
        ac == true
        ? Icon(Icons.ac_unit)
        : Text(''),
        tv == true
        ? Icon(Icons.tv)
        : Text(''),
        parking == true
        ? Icon(Icons.local_parking)
        : Text(''),
      ],
    );
  }
}