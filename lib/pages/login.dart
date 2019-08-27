import 'package:flutter/material.dart';
import 'package:uno/pages/registration.dart';
import 'package:uno/widget/atoms/FButton.dart';
import 'package:uno/widget/atoms/FForm.dart';
import 'package:uno/widget/atoms/FLogo.dart';

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
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Padding(padding: EdgeInsets.all(2.0),),
          FLogo(
            text: 'Login',
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
                      text: "Register",
                      info: "Don't have an account? Register here",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()));
                      }),
                ],
              )),
        ],
      )),
    );
  }
}
