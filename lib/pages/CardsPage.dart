import 'package:LFS/widget/HomeWidgets/AppBarPage.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  final List cards;
  CardsPage({this.cards});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarPage(),
      ),
      body: ListView(
        children: <Widget>[Text("Cards")],
      ),
    );
  }
}
