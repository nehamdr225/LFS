import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/NavigationPage.dart';
import 'package:LFS/pages/SigninPage.dart';
import 'package:LFS/pages/SignupPage.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: FancyText(
                  text: "LFS",
                  textColor: primary,
                  size: 32.0,
                ),
                padding: EdgeInsets.only(top: 80),
              ),
              Padding(
                child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        OutlineButton(
                            textColor: Colors.white,
                            borderSide:
                                BorderSide(color: Colors.white, width: 3.0),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  wordSpacing: 4),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInPage()));
                            }),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                        ),
                        OutlineButton(
                            textColor: Colors.white,
                            borderSide:
                                BorderSide(color: Colors.white, width: 3.0),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  wordSpacing: 4),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            }),
                      ],
                    )),
                padding: EdgeInsets.only(top: 200),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 100.0),
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
              )
            ],
          ),
        ),
      ]),
    );
  }
}
