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
  String nameErr, emailErr, passwordErr, signupErr, cardIdErr, verifyCardErr;
  bool isVerifying = false;
  bool isCardValid = false;

  @override
  Widget build(BuildContext context) {
    final setName = (data) {
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

    final setEmail = (data) {
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

    final setPassword = (data) {
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

    final setCardID = (id) {
      if (id != cardId && id != null && cardIdValidator(id))
        setState(() {
          cardId = id;
          cardIdErr = null;
        });
      else
        setState(() {
          cardIdErr = "Card ID is not valid!";
        });
    };

    final signupUser = () async {
      final message = await signup(email, password, name, cardId);
      if (message['error'] != null)
        setState(() {
          signupErr = message['error'];
        });
      else
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
    };

    final verifyUser = () async {
      print(cardId);
      if (cardId != null && cardId.length > 5) {
        setState(() {
          isVerifying = true;
        });
        final message = await verifyCard(cardId);
        print(message);
        if (message['error'] != null) {
          setState(() {
            verifyCardErr = "Error Verifying CardID!";
          });
        } else if (message['message'] != null) {
          setState(() {
            isCardValid = true;
          });
        }
      } else {
        setState(() {
          verifyCardErr = "Card is not valid!";
        });
      }
      setState(() {
        isVerifying = false;
      });
    };

    final setVerifyCardErr = (data) => setState(() {
          verifyCardErr = data;
        });

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
      cardIdErr: cardIdErr,
      verifyUser: verifyUser,
      verifyCardErr: verifyCardErr,
      isVerifying: isVerifying,
      setVerifyCardErr: setVerifyCardErr,
      isCardValid: isCardValid,
      cardId: cardId,
    );
  }
}
