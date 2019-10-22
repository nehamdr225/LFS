import 'package:LFS/constants/colors.dart';
import 'package:LFS/helpers/api.dart';
import 'package:LFS/pages/SigninPage.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:LFS/widget/atoms/FForm.dart';

class Activation extends StatefulWidget {
  final String mailErr, user;
  Activation({Key key, this.mailErr, this.user}) : super(key: key);

  _ActivationState createState() => _ActivationState();
}

class _ActivationState extends State<Activation> {
  String activationCode, activationErr;
  bool isActivating = false;
  bool isRecentActive = false;
  String mailErr;
  @override
  Widget build(BuildContext context) {
    Future<void> resendCode() async {
      setState(() {
        isRecentActive = true;
      });
      final response = await activationCodeResend(widget.user);
      if (response['error'] != null)
        setState(() {
          mailErr = response['error'];
          isRecentActive = false;
        });
      else if (response['mailErr'] != null)
        setState(() {
          mailErr = response['mailErr'];
          isRecentActive = false;
        });
      else
        setState(() {
          mailErr = "Activation code has been re-sent.";
          isRecentActive = false;
        });
    }

    Future<void> confirmActivationCode() async {
      setState(() {
        isActivating = true;
      });
      final result = await activateUser(activationCode, widget.user);
      if (result['error'] != null)
        setState(() {
          isActivating = false;
          activationErr = result['err'];
        });
      else
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppbar(
            leadingChoice: false,
            search: false,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                widget.mailErr != null
                    ? widget.mailErr
                    : mailErr != null
                        ? mailErr
                        : 'An activation code was sent to your email address.',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  color: textColor,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            FForm(
              text: 'Activation Code',
              icon: Icon(Icons.confirmation_number),
              type: TextInputType.number,
              obscure: false,
              autofocus: true,
              onChanged: (data) {
                if (data != null && activationCode != data)
                  setState(() {
                    activationCode = data;
                  });
              },
              // icon: Icons.lock_open,
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
            ),
            Container(
              width: 200.0,
              alignment: Alignment.center,
              child: isActivating == false
                  ? RaisedButton(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Helvetica",
                            fontSize: 16),
                      ),
                      onPressed:
                          isActivating == false ? confirmActivationCode : null,
                    )
                  : CircularProgressIndicator(),
            ),
            Container(
              width: 200.0,
              alignment: Alignment.center,
              child: isRecentActive == false
                  ? FlatButton(
                      child: Text(
                        'Resend Code',
                        style:
                            TextStyle(fontFamily: "Helvetica", fontSize: 16.0),
                      ),
                      onPressed: isRecentActive == false ? resendCode : null,
                    )
                  : CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
