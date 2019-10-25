import 'package:LFS/constants/colors.dart';
import 'package:LFS/pages/SigninPage.dart';
import 'package:LFS/pages/SignupPage.dart';
import 'package:LFS/widget/atoms/FButton.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';

class UserPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight,
          minWidth: screenWidth,
        ),
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Padding(padding: EdgeInsets.all(50.0),),
              Container(
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      FButton(
                          text: "Sign-in",
                          textColor: lfsWhite,
                          color: primary,
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
                          textColor: textColor,
                          color: lfsWhite,
                          info: '',
                          onTap: null,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          }),
                    ],
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
