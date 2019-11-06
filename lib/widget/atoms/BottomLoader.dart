import 'package:flutter/material.dart';

class BottomLoader extends StatefulWidget {
  BottomLoader({Key key}) : super(key: key);

  _BottomLoaderState createState() => _BottomLoaderState();
}

class _BottomLoaderState extends State<BottomLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: CircularProgressIndicator(),
    );
  }
}
