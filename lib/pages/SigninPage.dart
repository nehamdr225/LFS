import 'package:LFS/helpers/api.dart';
import 'package:LFS/helpers/validators.dart';
import 'package:LFS/pages/NavigationPage.dart';
import 'package:LFS/state/user.dart';
import 'package:LFS/constants/colors.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/FForm.dart';
import 'package:LFS/widget/atoms/FLogo.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignInPage> {
  String cardId, password, cardIdErr, passwordErr, loginErr;
  bool isSigningIn = false;
  bool remember = true;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);

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

    var setPassword = (data) {
      if (pwdValidator(data) && data != password && data.length >= 8)
        setState(() {
          password = data;
          passwordErr = null;
        });
      else if (passwordErr == null)
        setState(() {
          passwordErr = "Password is not valid!";
        });
    };

    var loginUser = () async {
      try {
        if (cardIdValidator(cardId) && pwdValidator(password)) {
          setState(() {
            isSigningIn = true;
          });
          Map token = await login(cardId, password, remember);
          if (token['error'] == null) {
            user.token = token['token'];
            getUser(token['token']).then((userData) {
              user.user = userData;
            });
            setState(() {
              isSigningIn = false;
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NavigationPage()));
          } else
            setState(() {
              isSigningIn = false;
              loginErr = token['error'];
            });
        }
      } catch (err) {
        print(err);
        setState(() {
          isSigningIn = false;
          loginErr = "Please provide correct login info.";
        });
      }
    };

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: FAppbar(
              leadingChoice: false,
              search: false,
              title: "Sign In",
            )),
        backgroundColor: lfsWhite,
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)),
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
            ),
            FForm(
              icon: Icon(Icons.vpn_key),
              type: TextInputType.text,
              text: "Password",
              obscure: true,
              onChanged: setPassword,
              autofocus: false,
              error: passwordErr,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: remember,
                      onChanged: (bool value) {
                        setState(() {
                          remember = value;
                        });
                      }),
                  Text(
                    'Remember Password',
                    style: TextStyle(fontFamily: 'Helvetica', color: textColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: 200.0,
              alignment: Alignment.center,
              child: isSigningIn == false
                  ? RaisedButton(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Helvetica",
                            fontSize: 18),
                      ),
                      onPressed: isSigningIn == false ? loginUser : null,
                    )
                  : CircularProgressIndicator(),
            ),
            loginErr != null
                ? Text(
                    loginErr,
                    style: TextStyle(
                      color: errorColor,
                      fontFamily: "Helvetica",
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
