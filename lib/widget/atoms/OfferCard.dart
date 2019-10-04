import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/DetailPage.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final image;
  final name;
  final id;
  final address;
  final contact;
  final padding;
  OfferCard(
      {this.image,
      this.name,
      this.address,
      this.contact,
      this.id,
      this.padding: 5.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(id: id),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: padding, right: padding),
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
              child: Text(
                name,
                style: TextStyle(fontSize: 28),
              ),
              alignment: Alignment.topCenter,
            ),
            Column(
              children: <Widget>[
                Align(
                  child: Row(children: [
                    Icon(Icons.local_offer, color: Colors.white, size: 16 ),
                    Text(" 5% OFF ",
                        style: TextStyle(
                          fontSize: 18,
                          backgroundColor: buttonColor,
                        ))
                  ]),
                  alignment: Alignment.topLeft,
                ),
                Align(
                  child: Row(children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 16
                    ),
                    Text(
                      address,
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                  alignment: Alignment.bottomLeft,
                ),
                Align(
                  child: Row(children: [
                    Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 16
                    ),
                    Text(
                      contact,
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                  alignment: Alignment.bottomLeft,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
