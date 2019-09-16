import 'package:LFS/widget/HomeWidgets/AppBarPage.dart';
import 'package:LFS/widget/HomeWidgets/FCarousel.dart';
import 'package:LFS/widget/HomeWidgets/bottomnavbar/FancyTabBar.dart';
//import 'package:LFS/widget/HomeWidgets/HorizontalSlider.dart';
import 'package:LFS/widget/HomeWidgets/MenuBar.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title}): super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBarPage(),
          ),
          bottomNavigationBar: FancyTabBar(),
          // Container(
          //   color: Colors.white,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: <Widget>[
          //       IconButton(
          //         color: Colors.blue[900],
          //         icon: Icon(Icons.category),
          //         onPressed: (){},
          //       ),
          //       IconButton(
          //         color: Colors.blue[900],
          //         icon: Icon(Icons.home),
          //         onPressed: (){},
          //       ),                
          //       IconButton(
          //         color: Colors.blue[900],
          //         icon: Icon(Icons.account_circle),
          //         onPressed: (){},
          //       ),
          //     ],
          //   ),
          // ) ,
          body: ListView(
            children: <Widget>[
              MenuBar(),
              Padding(padding: EdgeInsets.all(8.0),),
              FCarousel(),
              Padding(padding: EdgeInsets.all(8.0),),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: FancyText(
                  text: "Exclusive Discounts",
                  textColor: Colors.blue[900],
                  size: 20.0,
                ),
              ),
              Container(
                //child: AsymmetricView(),
              )
              
            ],
          )),
    );
  }
}
