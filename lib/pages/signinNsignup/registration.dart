import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
import 'package:LFS/pages/signinNsignup/Activation.dart';
import 'package:LFS/pages/signinNsignup/login.dart';
import 'package:LFS/widget/atoms/FButton.dart';
import 'package:LFS/widget/atoms/FForm.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Padding(padding: EdgeInsets.all(2.0),),
              //FLogo(text: 'Register',),
              FancyText(
                text: "Sign Up",
                size: 26.0,
              ),
              Container(
                  alignment: Alignment.center,
                  width: screenwidth * 0.90,
                  child: Column(
                    children: <Widget>[
                      FForm(
                        text: 'Id',
                        obscure: false,
                        type: TextInputType.text,
                        // icon: Icons.people,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      FForm(
                        text: 'Email',
                        obscure: false,
                        type: TextInputType.emailAddress,
                        // icon: Icons.email,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      FForm(
                        text: 'Phone No.',
                        obscure: false,
                        type: TextInputType.phone,
                        // icon: Icons.phone,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                      ),
                      //FForm(text: 'Password', obscure: true, type:TextInputType.text),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                      ),
                      FButton(
                          text: "Submit",
                          textColor: Colors.white,
                          color: Colors.blue[900],
                          info: 'Already have an account? Login here',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Activation()));
                          },
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
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
