import 'package:LFS/pages/MerchantsPage.dart';
import 'package:LFS/widget/HomeWidgets/AppBarPage.dart';
import 'package:LFS/widget/atoms/Cards.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarPage(),
      ),
      body: ListView(
        children: <Widget>[
          Cards(
            image: 'assets/images/CategoryPage/hotel.jpg',
            text: 'Hotels',
            height: 203.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MerchantsPage(type: 'Hotel')),
              );
            },
          ),
          Cards(
            image: 'assets/images/CategoryPage/Restaurant.jpg',
            text: 'Restaurants',
            height: 240.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MerchantsPage(type: 'Restaurant')),
              );
            },
          ),
          Cards(
            image: 'assets/images/CategoryPage/shoppingMall.jpg',
            text: 'Shopping Malls',
            height: 197.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MerchantsPage(type: 'Shopping Malls')),
              );
            },
          ),
          Cards(
            image: 'assets/images/categoryPics/lfsMovieHall.jpg',
            text: 'Movie Halls',
            height: 260.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MerchantsPage(type: 'Movie')),
              );
            },
          ),
        ],
      ),
    );
  }
}
