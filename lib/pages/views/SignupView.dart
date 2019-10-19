import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/FForm.dart';
import 'package:LFS/widget/atoms/FLogo.dart';

import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  final String nameErr,
      emailErr,
      passwordErr,
      signupErr,
      cardIdErr,
      verifyCardErr,
      cardId;
  final Function setName, setEmail, setPassword, setCardId;
  final Function signupUser, verifyUser, setVerifyCardErr;
  final bool isVerifying, isCardValid;

  SignupView(
      {this.nameErr,
      this.emailErr,
      this.passwordErr,
      this.signupErr,
      this.setName,
      this.setEmail,
      this.setPassword,
      this.signupUser,
      this.cardIdErr,
      this.setCardId,
      this.verifyUser,
      this.verifyCardErr,
      this.isVerifying,
      this.setVerifyCardErr,
      this.isCardValid,
      this.cardId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppbar(
            search: false,
            leadingChoice: false,
            title: "Sign Up",
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
                        icon: Icon(Icons.card_membership),
                        text: "Card ID",
                        onChanged: setCardId,
                        autofocus: false,
                        error: cardIdErr,
                        value: cardId),
                    FForm(
                      autofocus: true,
                      icon: Icon(Icons.person_outline),
                      text: "Name",
                      onChanged: setName,
                      error: nameErr,
                      value: null,
                    ),
                    FForm(
                      icon: Icon(
                        Icons.mail_outline,
                        color: navColor,
                      ),
                      type: TextInputType.emailAddress,
                      text: "Email",
                      error: emailErr,
                      onChanged: setEmail,
                      autofocus: false,
                    ),
                    FForm(
                      icon: Icon(Icons.vpn_key),
                      type: TextInputType.visiblePassword,
                      text: "Password",
                      obscure: true,
                      onChanged: setPassword,
                      error: passwordErr,
                      autofocus: false,
                    ),
                    Container(
                      width: 200.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Helvetica",
                              fontSize: 18),
                        ),
                        onPressed: signupUser,
                      ),
                    ),
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
                      text: "Card ID",
                      onChanged: setCardId,
                      error: cardIdErr,
                    ),
                    Container(
                      width: 200.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        child: Text(
                          "Verify Card",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Helvetica",
                              fontSize: 18),
                        ),
                        onPressed: isVerifying == false ? verifyUser : null,
                      ),
                    )
                  ],
          ),
        ),
      ),
    );
  }
}
