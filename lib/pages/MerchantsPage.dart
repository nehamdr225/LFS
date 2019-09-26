import 'package:LFS/widget/HomeWidgets/AppBarPage.dart';
import 'package:LFS/widget/HomeWidgets/Category.dart';
import 'package:LFS/state/merchants.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
// import 'package:LFS/widget/atoms/FText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:LFS/constants/colors.dart';

class MerchantsPage extends StatelessWidget {
  final String type;
  MerchantsPage({this.type});
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    final merchants = Provider.of<MerchantsModel>(context).merchants;
    print(type);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarPage(
          elevation: 2.0,
          select: true,
          search: true,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
            child: FancyText(
              text: 'Recommendations',
              textColor: primary,
              size: 20.0,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
            child: FancyText(
              text: 'View All Merchants',
              textColor: primary,
              size: 10.0,
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
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                print(merchants[index]['media']);
                return Card(
                  elevation: 2.0,
                  shape: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.grey[200]),
                  child: Category(
                    name: merchants[index]['name'],
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
          
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 15.0),
            child: FancyText(
              text: '$type Offers & Discounts',
              textColor: primary,
              size: 20.0,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
            child: FancyText(
              text: 'View All Offers',
              textColor: primary,
              size: 10.0,
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            height: screenHeight,
            width: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                print(merchants[index]['media']);
                return Card(
                  elevation: 2.0,
                  shape: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.grey[200]),
                  child: Category(
                    name: merchants[index]['name'],
                    height: 250.0,
                    width: 300.0,
                    network: merchants[index]['media'] != null
                        ? merchants[index]['media']['src'][0]
                        : null,
                  ),
                );
              }, //
            ),
          ),
          
        ],
      ),
    );
  }
}
