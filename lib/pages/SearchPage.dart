import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:LFS/state/merchants.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List searchResult = [];
  TextStyle style = const TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: primary);

  @override
  Widget build(BuildContext context) {
    final merchants = Provider.of<MerchantsModel>(context).merchants;

    void search(String query) {
      // print(query);
      List result = merchants.where((merchant) {
        return merchant["name"].toLowerCase().contains(query.toLowerCase()) ||
            merchant["address"].toLowerCase().contains(query.toLowerCase()) ||
            merchant["category"].toLowerCase().contains(query.toLowerCase());
      }).toList();
      if (result != null && result.length > 0)
        setState(() {
          searchResult = result;
        });
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppbar(
              leadingChoice: false,
              search: false,
              searchBar: true,
              searchController: search),
        ),
        body: Container(
            child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          children: searchResult.length > 0
              ? searchResult.map((result) {
                  return Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(result["name"]),
                          Text(result["address"])
                        ],
                      )
                    ],
                  );
                }).toList()
              : [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Did not find any matches!",
                      style: TextStyle(
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ])
                ],
        )));
  }
}
