import 'package:LFS/widget/atoms/FForm.dart';
import 'package:LFS/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  final String emailErr, passwordErr, loginErr;
  final Function setPassword, setEmail, loginUser;
  SigninView(
      {this.emailErr,
      this.passwordErr,
      this.loginErr,
      this.setEmail,
      this.setPassword,
      this.loginUser});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                SizedBox(height: 15.0),
                loginErr != null
                    ? Text(loginErr, style: TextStyle(color: Colors.red))
                    : Text(''),
                FRaisedButton(
                  text: "Sign-in",
                  width: 160.0,
                  bg: Colors.deepPurple[900],
                  color: Colors.white,
                  onPressed: loginUser,
                ),
                SizedBox(height: 30.0),
                // FancyText(
                //   color: Colors.deepPurple[900],
                //   decoration: TextDecoration.underline,
                //     text: "Don't have an account? Register Here !",
                //     size: 15.0,
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => SignUpPage()));
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
