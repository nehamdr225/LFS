import 'package:LFS/helpers/api.dart';
import 'package:LFS/helpers/validators.dart';
import 'package:LFS/pages/SigninPage.dart';
import 'package:LFS/pages/views/SignupView.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignUpPage> {
  String name, email, password, cardId;
  String nameErr, emailErr, passwordErr, signupErr, cardIdErr;
  @override
  Widget build(BuildContext context) {
    var setName = (data) {
      if (nameValidator(data) && data != name)
        setState(() {
          name = data;
          nameErr = null;
        });
      else if (emailErr != null)
        setState(() {
          nameErr = "name is not valid!";
        });
    };

    var setEmail = (data) {
      if (emailValidator(data) && data != email)
        setState(() {
          email = data;
          emailErr = null;
        });
      else if (emailErr != null)
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
      else if (passwordErr != null)
        setState(() {
          passwordErr = "Password not valid!";
        });
    };

    var setCardID = (id) {
      if (id != cardId && id != null)
        setState(() {
          cardId = id;
          cardIdErr = null;
        });
      else
        setState(() {
          cardIdErr = "Card ID is not valid!";
        });
    };

    var signupUser = () async {
      var message = await signup(email, password, name);
      if (message['error'] != null)
        setState(() {
          signupErr = message['error'];
        });
      else
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
    };

    return SignupView(
        emailErr: emailErr,
        passwordErr: passwordErr,
        setEmail: setEmail,
        setPassword: setPassword,
        setName: setName,
        signupErr: signupErr,
        signupUser: signupUser,
        nameErr: nameErr,
        setCardId: setCardID,
        cardIdErr: cardIdErr);
  }
}
