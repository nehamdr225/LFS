import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/FForm.dart';
import 'package:LFS/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  final String nameErr, emailErr, passwordErr, signupErr;
  final Function setName, setEmail, setPassword, signupUser;
  SignupView(
      {this.nameErr,
      this.emailErr,
      this.passwordErr,
      this.signupErr,
      this.setName,
      this.setEmail,
      this.setPassword,
      this.signupUser});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 2.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
        ),
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomPadding: false,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            height: 600.0,
            width: screenWidth * 0.95,
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                FForm(
                  type: TextInputType.text,
                  text: "Name",
                  onChanged: setName,
                ),
                nameErr != null
                    ? Text(
                        nameErr,
                        textAlign: TextAlign.center,
                      )
                    : Text(''),
                SizedBox(height: 15.0),
                FForm(
                    type: TextInputType.emailAddress,
                    text: "Email",
                    onChanged: setEmail),
                emailErr != null
                    ? Text(
                        emailErr,
                        textAlign: TextAlign.center,
                      )
                    : Text(''),
                SizedBox(height: 15.0),
                FForm(
                    type: TextInputType.text,
                    text: "Password",
                    obscure: true,
                    onChanged: setPassword),
                passwordErr != null
                    ? Text(
                        passwordErr,
                        textAlign: TextAlign.center,
                      )
                    : Text(''),
                signupErr != null ? Text(signupErr) : Text(''),
                SizedBox(height: 15.0),
                // FForms(type: TextInputType.phone, text: "Mobile No."),
                FRaisedButton(
                  text: "Sign-up",
                  width: 160.0,
                  color: Colors.white,
                  bg: primary,
                  onPressed: signupUser,
                ), //onPressed: () {}),
                SizedBox(height: 30.0),
                // FancyText(
                //     text: "Already have an account?",
                //     color: Colors.deepPurple[900],
                //     decoration: TextDecoration.underline,
                //     size: 15.0,
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => SigninPage()),
                //       );
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
