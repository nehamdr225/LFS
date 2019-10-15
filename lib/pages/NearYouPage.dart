import 'package:LFS/widget/HomeWidgets/FollowAt.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/OfferCard.dart';
import 'package:LFS/widget/atoms/connectivityError.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:LFS/state/merchants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:LFS/state/user.dart';

class NearYouPage extends StatefulWidget {
  final String type;
  final String id;

  NearYouPage({Key key, this.type, this.id}) : super(key: key);

  _NearYouPageState createState() => _NearYouPageState();
}

class _NearYouPageState extends State<NearYouPage> {
  var distance = "N/A";
  var filtered = [];
  getPosition() async => await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  getDistance(Position user, List merchant) async =>
      await Geolocator().distanceBetween(user.latitude, user.longitude,
          double.parse(merchant[0]), double.parse(merchant[1])) /
      1000;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    final userLocation = Provider.of<UserModel>(context).location;
    print(userLocation);
    var merch = Provider.of<MerchantsModel>(context);
    var merchants = merch.category(widget.type);
    if (filtered.length == 0)
      merch.location(merchants).then((data) {
        setState(() {
          filtered = data;
        });
      });
    // print(filtered);
    //final merchant = Provider.of<MerchantsModel>(context).one(widget.id);

    // List nearYou = [ ];
    // if (merchant["location"].isNotEmpty && merchant["location"] != null)
    //   getPosition()
    //       .then((data) => getDistance(data, merchant["location"]).then((dist) {
    //             nearYou.add(dist);
    //           }));
    // nearYou.sort();
    // print(nearYou);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
          title: "${widget.type} Near You",
        ),
      ),
      body: ListView(
          children: merchants.length != 0
              ? <Widget>[
                  Padding(padding: EdgeInsets.all(5.0)),
                  Container(
                    height: screenHeight - 100,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
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
