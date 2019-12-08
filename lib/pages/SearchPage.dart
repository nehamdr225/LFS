import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/DetailPage.dart';
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
      List result = [];
      if (query.length > 0)
        result = merchants.where((merchant) {
          return merchant["name"].toLowerCase().contains(query.toLowerCase()) ||
              merchant["address"].toLowerCase().contains(query.toLowerCase()) ||
              merchant["category"].toLowerCase().contains(query.toLowerCase());
        }).toList();
      if (result != null)
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
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(id: result["_id"])),
                        );
                      },
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.help_outline,
                          size: 22,
                          color: Colors.white,
                        ),
                        radius: 12.0,
                        backgroundColor: deepBlue,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 14),
                      title: Text(
                        result["name"],
                        style: TextStyle(
                            color: textColor, fontFamily: "Helvetica"),
                      ),
                      subtitle: Text(
                        result["address"],
                        style: TextStyle(
                            color: textColor, fontFamily: "Helvetica"),
                      ));
                }).toList()
              : [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Did not find any matches!",
                        style: TextStyle(
                            color: textColor, fontFamily: "Helvetica"),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ],
        )));
  }
}
