import 'package:flutter/material.dart';
import 'package:uno/pages/Activation.dart';
import 'package:uno/pages/login.dart';
import 'package:uno/widget/atoms/FButton.dart';
import 'package:uno/widget/atoms/FForm.dart';
import 'package:uno/widget/atoms/FLogo.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Padding(padding: EdgeInsets.all(2.0),),
            FLogo(text: 'Register',),
            Container(
                alignment: Alignment.center,
                width: screenwidth * 0.90,
                child: Column(
                  children: <Widget>[
                    FForm(text: 'Id', obscure: false, type:TextInputType.text, icon: Icons.people,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    FForm(text: 'Email', obscure: false, type:TextInputType.emailAddress, icon: Icons.email,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    FForm(text: 'Phone No.', obscure: false, type:TextInputType.phone, icon: Icons.phone,),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                    ),
                    //FForm(text: 'Password', obscure: true, type:TextInputType.text),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    FButton(
                      text: "Submit",
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
    );
  }
}
