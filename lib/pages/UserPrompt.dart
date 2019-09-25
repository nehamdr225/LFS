import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/NavigationPage.dart';
import 'package:LFS/pages/SigninPage.dart';
import 'package:LFS/pages/SignupPage.dart';
import 'package:LFS/widget/atoms/FButton.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:LFS/widget/atoms/UnderlinedText.dart';
// import 'package:LFS/widget/atoms/Logo.dart';
import 'package:flutter/material.dart';

class UserPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: screenHeight,
          width: screenWidth,
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fitHeight),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Logo(),
              FancyText(
                  text: "LFS",
                  textColor: primary,
                  size: 32.0,
                ),
              
              SizedBox(height: 300.0,),
              Container(
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      FButton(
                          text: "Sign-in",
                          textColor: Colors.white,
                          color: Colors.blue[900],
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          }),
                      Padding(
                        padding: EdgeInsets.only(bottom: 14.0),
                      ),
                      FButton(
                          text: "Sign-up",
                          textColor: Colors.black,
                          color: Colors.white,
                          info: '',
                          onTap: null,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registration()));
                          }),
                    ],
                  )),
                  Padding(
                        padding: EdgeInsets.only(bottom: 14.0),
                      ),
              UnderlinedText(
                text: "Continue without sign-in",
                size: 18.0,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationPage()));
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 28.0),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
