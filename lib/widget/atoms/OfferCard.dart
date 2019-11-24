import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/DetailPage.dart';
import 'package:LFS/widget/atoms/IconLabel.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final image, name, id, address, contact, padding, distance, discount;
  OfferCard(
      {this.image,
      this.name,
      this.address,
      this.contact,
      this.id,
      this.padding: 5.0,
      this.distance,
      this.discount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
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
            color: Colors.black12,
            backgroundBlendMode: BlendMode.darken,
            image: DecorationImage(
                image:
                    NetworkImage(image) ?? AssetImage("assets/images/logo.png"),
                fit: BoxFit.fill,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Align(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment.topCenter,
              ),
              Column(
                children: <Widget>[
                  distance != null
                      ? IconLabel(
                          text: "$distance km",
                          icon: Icons.local_taxi,
                        )
                      : Text(""),
                  IconLabel(
                      text: discount ?? "5% OFF",
                      icon: Icons.local_offer,
                      bg: buttonColor),
                  IconLabel(text: address, icon: Icons.location_on),
                  IconLabel(text: contact, icon: Icons.call),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
