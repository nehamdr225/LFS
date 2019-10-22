import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/state/user.dart';
import 'package:LFS/state/merchants.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatefulWidget {
  FavouritesPage({Key key}) : super(key: key);

  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    final MerchantsModel merchants = Provider.of<MerchantsModel>(context);
    final List favourites = Provider.of<UserModel>(context).favourites;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
          search: false,
          title: "Favourites",
        ),
      ),
      body: ListView(
        children: <Widget>[
          favourites.length > 0
              ? favourites.map((fav) {
                  final merchant = merchants.one(fav);
                  return Row(
                    children: <Widget>[
                      Text(merchant['name']),
                      Text(merchant['address'])
                    ],
                  );
                })
              : Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Your favourites list is empty.",
                    style: TextStyle(fontFamily: "Helvetica"),
                  ),
                ),
        ],
      ),
    );
  }
}
