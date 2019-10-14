import 'package:LFS/widget/HomeWidgets/FollowAt.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/InfoNavBar.dart';
import 'package:LFS/widget/atoms/OfferCard.dart';
import 'package:LFS/widget/atoms/connectivityError.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:LFS/state/merchants.dart';
// import 'package:LFS/state/user.dart';

class NearYouPage extends StatefulWidget {
  final String type;
  NearYouPage({Key key, this.type}) : super(key: key);

  _NearYouPageState createState() => _NearYouPageState();
}

class _NearYouPageState extends State<NearYouPage> {
  @override
  Widget build(BuildContext context) {
    // final userLocation = Provider.of<UserModel>(context).location;
    var merchants = Provider.of<MerchantsModel>(context).category(widget.type);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
          title: widget.type,
        ),
      ),
      body: ListView(
          children: merchants.length != 0
              ? <Widget>[
                  Padding(padding: EdgeInsets.all(10)),
                  InfoNavBar(
                      type: widget.type,
                      text: "${widget.type} Offers & Discounts",
                      offerCard: true),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: merchants.length >= 5 ? 5 : merchants.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OfferCard(
                          image: merchants[index]['media'] != null
                              ? merchants[index]['media']['src'][0]
                              : null,
                          name: merchants[index]['name'],
                          id: merchants[index]['_id'],
                          address: merchants[index]['address'],
                          contact: merchants[index]['contact'],
                        );
                      }, //
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Follow(),
                  Padding(padding: EdgeInsets.all(10.0)),
                ]
              : <Widget>[
                  // merchantErr != null
                  //     ? ConnError(error: merchantErr)
                  ConnError()
                ]),
    );
  }
}
