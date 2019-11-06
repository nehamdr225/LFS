import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/BottomLoader.dart';
import 'package:LFS/widget/atoms/OfferCard.dart';
import 'package:LFS/widget/atoms/connectivityError.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:LFS/state/merchants.dart';
import 'package:geolocator/geolocator.dart';

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
    // final screenHeight = MediaQuery.of(context).size.height;
    final merch = Provider.of<MerchantsModel>(context);
    List merchants = merch.category(widget.type);

    if (filtered.length == 0 && merchants.length > 0)
      merch.location(merchants).then((data) {
        setState(() {
          filtered = data;
        });
      });

    getEachMerchant(id) =>
        merchants.firstWhere((merchant) => merchant["_id"] == id);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppbar(
            leadingChoice: false,
            title: "Near You",
          ),
        ),
        body: merchants.length != 0
            ? filtered.length > 0
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: filtered.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      final nearMerchant = index < filtered.length
                          ? getEachMerchant(filtered[index][0])
                          : {};
                      return index == filtered.length
                          ? BottomLoader()
                          : OfferCard(
                              image: nearMerchant['media'] != null
                                  ? nearMerchant['media']['src'][0]
                                  : null,
                              name: nearMerchant['name'],
                              id: nearMerchant['_id'],
                              address: nearMerchant['address'],
                              contact: nearMerchant['contact'],
                              padding: 0.0,
                              distance: filtered[index][1].toStringAsFixed(2));
                    }, //
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100.0,
                    child: MaterialButton(
                      child: CircularProgressIndicator(),
                      onPressed: () {},
                    ))
            : ListView(
                children: <Widget>[
                  // merchantErr != null
                  //     ? ConnError(error: merchantErr)
                  ConnError()
                ],
              ));
  }
}
