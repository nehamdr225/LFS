import 'package:LFS/helpers/api.dart';
import 'package:LFS/helpers/validators.dart';
import 'package:LFS/pages/ActivationPage.dart';
import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/FForm.dart';
import 'package:LFS/widget/atoms/FLogo.dart';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignUpPage> {
  String name, email, password, cardId;
  String nameErr, emailErr, passwordErr, signupErr;
  String cardIdErr, verifyCardErr, mailErr, userId;
  bool isVerifying = false;
  bool isCardValid = false;
  bool isRegistering = false;

  @override
  Widget build(BuildContext context) {
    final setName = (data) {
      if (nameValidator(data) && data != name && data != null)
        setState(() {
          name = data;
          nameErr = null;
        });
      else {
        setState(() {
          nameErr = "Name is not valid!";
        });
      }
    };

    final setEmail = (data) {
      if (emailValidator(data) && data != email && data != null)
        setState(() {
          email = data;
          emailErr = null;
        });
      else
        setState(() {
          emailErr = "Email is not valid!";
        });
    };

    final setPassword = (data) {
      if (pwdValidator(data) && data != password && data.length >= 8)
        setState(() {
          password = data;
          passwordErr = null;
        });
      else
        setState(() {
          passwordErr = "Password not valid! (hint: p@55worD)";
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
      if (emailValidator(email) &&
          pwdValidator(password) &&
          nameValidator(name) &&
          cardIdValidator(cardId)) {
        setState(() {
          isRegistering = true;
        });
        final message = await signup(email, password, name, cardId);
        if (message['error'] != null)
          setState(() {
            signupErr = message['error'];
            isRegistering = false;
          });
        else if (message['mailErr'] != null) {
          setState(() {
            isRegistering = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Activation(
                    mailErr: message['mailErr'], user: message['id'])),
          );
        } else {
          setState(() {
            isRegistering = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Activation(user: message['id'])),
          );
        }
      }
    };

    final verifyUser = () async {
      if (cardId != null && cardId.length > 5) {
        setState(() {
          isVerifying = true;
        });
        final message = await verifyCard(cardId);
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppbar(
            search: false,
            leadingChoice: false,
            title: 'Sign Up',
          )),
      backgroundColor: lfsWhite,
      resizeToAvoidBottomPadding: false,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: ListView(
            children: isCardValid == true
                ? <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    FLogo(
                      height: 70.0,
                      width: 150.0,
                    ),
                    FForm(
                        autofocus: true,
                        icon: Icon(Icons.card_membership),
                        text: 'Card ID',
                        onChanged: setCardID,
                        error: cardIdErr,
                        value: cardId),
                    FForm(
                      icon: Icon(Icons.person_outline),
                      text: 'Name',
                      onChanged: setName,
                      error: nameErr,
                      autofocus: false,
                    ),
                    FForm(
                      icon: Icon(
                        Icons.mail_outline,
                        color: navColor,
                      ),
                      type: TextInputType.emailAddress,
                      text: 'Email',
                      error: emailErr,
                      onChanged: setEmail,
                      autofocus: false,
                    ),
                    FForm(
                      icon: Icon(Icons.vpn_key),
                      type: TextInputType.visiblePassword,
                      text: 'Password',
                      obscure: true,
                      onChanged: setPassword,
                      error: passwordErr,
                      autofocus: false,
                    ),
                    Container(
                      width: 200.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 20),
                      child: isRegistering == false
                          ? RaisedButton(
                              child: Text(
                                'Register Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Helvetica',
                                    fontSize: 18),
                              ),
                              onPressed:
                                  isRegistering == false ? signupUser : null,
                            )
                          : CircularProgressIndicator(),
                    ),
                    signupErr != null
                        ? Align(
                            alignment: Alignment.center,
                            child: Text(
                              signupErr,
                              style: TextStyle(
                                color: errorColor,
                                fontFamily: 'Helvetica',
                              ),
                            ))
                        : Text("")
                  ]
                : <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    FLogo(
                      height: 70.0,
                      width: 150.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    FForm(
                      autofocus: true,
                      icon: Icon(Icons.card_membership),
                      text: 'Card ID',
                      onChanged: setCardID,
                      error: cardIdErr,
                    ),
                    Container(
                      width: 200.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 20),
                      child: isVerifying == false
                          ? RaisedButton(
                              child: Text(
                                'Verify Card',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Helvetica',
                                    fontSize: 18),
                              ),
                              onPressed:
                                  isVerifying == false ? verifyUser : null,
                            )
                          : CircularProgressIndicator(),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    verifyCardErr != null
                        ? Align(
                            alignment: Alignment.center,
                            child: Text(
                              verifyCardErr,
                              style: TextStyle(
                                color: errorColor,
                                fontFamily: 'Helvetica',
                              ),
                            ))
                        : Text("")
                  ],
          ),
        ),
      ),
    );
  }
}
