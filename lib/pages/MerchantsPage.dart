import 'package:LFS/pages/ProductPage.dart';
import 'package:LFS/widget/HomeWidgets/Category.dart';
import 'package:LFS/state/merchants.dart';
import 'package:LFS/widget/HomeWidgets/FollowAt.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:LFS/widget/atoms/OfferCard.dart';
// import 'package:LFS/widget/atoms/FText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:LFS/constants/colors.dart';

class MerchantsPage extends StatelessWidget {
  final String type;
  MerchantsPage({this.type});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final merchants = Provider.of<MerchantsModel>(context).category(type);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
        ),
      ),
      body: ListView(
          children: merchants.length != 0
              ? <Widget>[
                  ////////////////////  TOP HORIZONTAL SCROLLER   ////////////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
                        child: FancyText(
                          text: 'Recommendations',
                          textColor: deepBlue,
                          size: 20.0,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
                        child: FancyText(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductsPage(
                                          type: type,
                                        ) //type: type,)
                                    ));
                          },
                          text: 'View All',
                          textColor: primary,
                          size: 12.0,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 120.0,
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
/////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////  MID HORIZONTAL SCROLLER  ////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 15.0),
                    child: FancyText(
                      text: '$type Offers & Discounts',
                      textColor: deepBlue,
                      size: 20.0,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
                    child: FancyText(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductsPage(
                                      type: type,
                                      offerCard: true,
                                    ) //type: type,)
                                ));
                      },
                      text: 'View All',
                      textColor: primary,
                      size: 12.0,
                      textAlign: TextAlign.right,
                    ),
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
                        );
                      }, //
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Follow(),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                ]
              ////////////////////////////////  ERROR MESSAGE WHEN NOT CONNECTED TO THE INTERNET ////////////////////
              : <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/error.png',
                                width: screenWidth * 0.80,
                              ),
                              FancyText(
                                text: 'Error ocurred! Try again later.',
                                textColor: errorColor,
                                size: 20.0,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      ])
                ]),
    );
  }
}
