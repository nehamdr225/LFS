import 'package:LFS/helpers/api.dart';
import 'package:LFS/helpers/validators.dart';
import 'package:LFS/pages/HomePage.dart';
import 'package:LFS/pages/views/SigninView.dart';
import 'package:LFS/state/user.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignInPage> {
  String email, password, emailErr, passwordErr, loginErr;

  @override
  Widget build(BuildContext context) {
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

    return SigninView(
      setEmail: setEmail,
      setPassword: setPassword,
      loginUser: loginUser,
      emailErr: email,
      passwordErr: passwordErr,
      loginErr: loginErr,
    );
  }
}
