import 'package:LFS/constants/colors.dart' as prefix0;
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/FButton.dart';
//import 'package:LFS/widget/atoms/FForm.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
        ),
      ),
      body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/categoryPics/lfsShoppingMall.jpg',
                height: 200.0,
                width: screenWidth,
              ),
            ),
            Container(
              color: Colors.black38,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // FForm(
                //   text: 'What are you looking for?',
                //   type: TextInputType.text,
                //   onChanged: (){
                //     Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => SearchPage()
                //   ),
                // );
                //   },
                // ),
                Center(
                  child: FButton(
                    text: 'Search',
                    textColor: prefix0.lfsWhite,
                    color: prefix0.buttonColor,
                    onPressed: () {
                      //   Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //     builder: (context) => SearchPage()
                      //),
                      //);
                    },
                    onTap: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      
    );
  }
}
