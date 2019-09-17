import 'package:LFS/pages/NavigationPage.dart';
import 'package:LFS/pages/signinNsignup/login.dart';
import 'package:LFS/pages/signinNsignup/registration.dart';
import 'package:LFS/widget/atoms/FButton.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:LFS/widget/atoms/UnderlinedText.dart';
import 'package:LFS/widget/atoms/Logo.dart';
import 'package:flutter/material.dart';

class UserPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Logo(),
            FancyText(
              text: "LFS",
              size: 24.0,
            ),
            Container(
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
                    Padding(padding: EdgeInsets.only(bottom: 8.0),),
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
            UnderlinedText(
                      text: "Continue without sign-in",
                      size: 18.0,
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavigationPage()));
                      },
                    ),
            Padding(padding: EdgeInsets.only(bottom: 28.0),),
          ],
        ),
      ),
    );
  }
}
