import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  final List cards;
  CardsPage({this.cards});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(),
      ),
      body: ListView(
        children: <Widget>[Text("Cards")],
      ),
    );
  }
}
