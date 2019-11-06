import 'package:LFS/constants/colors.dart';
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
    final user = Provider.of<UserModel>(context);
    final favourites = user.favourites;
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
        children: favourites.length > 0
            ? favourites.map((fav) {
                final merchant = merchants.one(fav);
                return Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset.fromDirection(1, 1),
                          blurRadius: 1),
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset.fromDirection(-1, 1),
                          blurRadius: 1)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Image.network(merchant['media']['src'][0]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              merchant['name'],
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  color: textColor,
                                  fontSize: 16.0),
                            ),
                            Text(
                              merchant['address'],
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  color: textColor,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        color: errorColor,
                        splashColor: primary,
                        icon: Icon(
                          Icons.remove_circle_outline,
                        ),
                        onPressed: () {
                          user.removeFromFav(merchant['_id']);
                        },
                      )
                    ],
                  ),
                );
              }).toList()
            : <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  alignment: Alignment.center,
                  child: Text(
                    "Your favourites list is empty.",
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        color: textColor,
                        fontSize: 16.0),
                  ),
                ),
              ],
      ),
    );
  }
}
