import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
import 'package:LFS/pages/signinNsignup/registration.dart';
import 'package:LFS/widget/atoms/FButton.dart';
import 'package:LFS/widget/atoms/FForm.dart';

class SignInPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignInPage> {
  String email, password;
  String emailErr, passwordErr;
  String loginErr;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            //Padding(padding: EdgeInsets.all(2.0),),
            FancyText(
              text: 'Login',
              size: 20.0,
            ),
            Container(
                alignment: Alignment.center,
                width: screenWidth * 0.90,
                child: Column(
                  children: <Widget>[
                    FForm(
                      text: 'Id',
                      obscure: false,
                      type: TextInputType.text,
                      icon: Icons.people,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    FForm(
                      text: 'Password',
                      obscure: true,
                      type: TextInputType.text,
                      icon: Icons.lock,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    FButton(
                        text: "Sign In",
                        textColor: Colors.white,
                        color: Colors.blue[900],
                        info: "Don't have an account? Register here",
                        onPressed: (){},
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration()));
                        }),
                  ],
                )),
        ],
      ),
          )),
    );
  }
}
