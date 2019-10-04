import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/DetailPage.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final image;
  final name;
  final id;
  final address;
  final contact;
  OfferCard({this.image, this.name, this.address, this.contact,this.id,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(name: name, id: id, address: address, contact: contact),
                ),
              );
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        width: MediaQuery.of(context).size.width - 20,
        height: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  NetworkImage(image) ?? AssetImage("assets/images/logo.png"),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
              child: Text(" 5% OFF ",
                  style: TextStyle(
                    fontSize: 18,
                    backgroundColor: buttonColor,
                  )),
              alignment: Alignment.topCenter,
            ),
            Align(
              child: Text(
                name,
                style: TextStyle(fontSize: 24),
              ),
              alignment: Alignment.topCenter,
            ),
            Align(
              child: Text(
                address,
                style: TextStyle(fontSize: 16),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Text(
                contact,
                style: TextStyle(fontSize: 16),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
