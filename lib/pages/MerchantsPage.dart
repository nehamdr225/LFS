import 'package:LFS/widget/HomeWidgets/Category.dart';
import 'package:LFS/state/merchants.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/BottomLoader.dart';
import 'package:LFS/widget/atoms/InfoNavBar.dart';
import 'package:LFS/widget/atoms/OfferCard.dart';
import 'package:LFS/widget/atoms/connectivityError.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MerchantsPage extends StatelessWidget {
  final String type, name;
  MerchantsPage({this.type, this.name});
  @override
  Widget build(BuildContext context) {
    final merchants = Provider.of<MerchantsModel>(context).category(type);

    print(type);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
          title: name,
        ),
      ),
      body: ListView(
          children: merchants.length != 0
              ? <Widget>[
                  InfoNavBar(type: type, text: "Recommendations"),
                  Container(
                    height: 140.0,
                    width: 150.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: merchants.length >= 5 ? 5 : merchants.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 3.0,
                          child: Category(
                            name: merchants[index]['name'],
                            id: merchants[index]['_id'],
                            width: 150.0,
                            height: 80.0,
                            network: merchants[index]['media'] != null
                                ? merchants[index]['media']['src'][0]
                                : null,
                          ),
                        );
                      }, //
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  InfoNavBar(
                    type: type,
                    text: "$type Offers & Discounts",
                    offerCard: true,
                  ),
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
                            distance: null,
                            discount: merchants[index]['discount']);
                      }, //
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                ]
              ////////////////////////////////  ERROR MESSAGE WHEN NOT CONNECTED TO THE INTERNET ////////////////////
              : <Widget>[
                  BottomLoader(),
                ]),
    );
  }
}
