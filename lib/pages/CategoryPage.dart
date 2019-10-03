import 'package:LFS/constants/categories.dart';
import 'package:LFS/pages/MerchantsPage.dart';
import 'package:LFS/widget/atoms/Cards.dart';

import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: CATEGORIES
          .map(
            (category) => Cards(
              image: category["image"],
              text: category["name"],
              height: 200.0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MerchantsPage(type: category["type"])),
                );
              },
            ),
          )
          .toList(),
    );
  }
}
