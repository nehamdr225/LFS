import 'package:LFS/widget/HomeWidgets/AppBarPage.dart';
import 'package:flutter/material.dart';

class MerchantsPage extends StatelessWidget {
  final String type;
  MerchantsPage({this.type});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarPage(),
      ),
      body: ListView(
        children: <Widget>[Text(type)],
      ),
    );
  }
}
