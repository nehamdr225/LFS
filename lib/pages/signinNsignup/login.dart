import 'package:LFS/helpers/api.dart';
import 'package:LFS/helpers/validators.dart';
import 'package:LFS/pages/HomePage.dart';
// import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:LFS/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';
import 'package:LFS/widget/atoms/FForm.dart';
import 'package:provider/provider.dart';
import 'package:LFS/state/user.dart';

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
    var user = Provider.of<UserModel>(context);

    var setEmail = (data) {
      if (emailValidator(data) && data != email)
        setState(() {
          email = data;
          emailErr = null;
        });
      else if (emailErr == null)
        setState(() {
          emailErr = "email is not valid!";
        });
    };

    var setPassword = (data) {
      // pwdValidator(data) &&
      if (data != password && data.length >= 8)
        setState(() {
          password = data;
          passwordErr = null;
        });
      else if (passwordErr == null)
        setState(() {
          passwordErr = "Password not valid!";
        });
    };

    var loginUser = () async {
      try {
        Map token = await login(email, password);
        if (token['error'] == null) {
          user.token = token['token'];
          getUser(token['token']).then((userData) {
            user.user = userData;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else
          setState(() {
            loginErr = token['error'];
          });
      } catch (err) {
        setState(() {
          loginErr = "Login failed!";
        });
      }
    };

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomPadding: false,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            height: 600.0,
            width: screenWidth * 0.95,
            padding: EdgeInsets.only(
                      top: 5.0, left: 20.0, right: 20.0),
            child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(10.0),),
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