import 'package:flutter/material.dart';
import 'package:LFS/widget/HomeWidgets/FCarousel.dart';

final List<Map> imgList = [
  {"src": "assets/images/categoryPics/lfsHotel.png", "label": "Hotel"},
  {"src": "assets/images/categoryPics/lfsRestaurants.jpg", "label": "Pokhara Hotel"},
  {"src": "assets/images/categoryPics/lfsHotel.png", "label": "New Hotels"}
];

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.asset(i["src"]),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                i["label"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class OverlayCarousel extends StatefulWidget {
  OverlayCarousel({Key key}) : super(key: key);

  _OverlayCarouselState createState() => _OverlayCarouselState();
}

class _OverlayCarouselState extends State<OverlayCarousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: child,
      autoPlay: true,
      enlargeCenterPage: true,
      aspectRatio: 2.0,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
    );
  }
}