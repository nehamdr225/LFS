import 'package:LFS/widget/atoms/FForm.dart';
import 'package:LFS/widget/atoms/FLogo.dart';
import 'package:flutter/material.dart';

class VerifyIdentity extends StatelessWidget {
  final Function handleMail, handleSendActivationCode;
  final isButtonActive, mailErr;
  VerifyIdentity(
      {Key key,
      this.handleMail,
      this.handleSendActivationCode,
      this.isButtonActive,
      this.mailErr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: FLogo(text: ''),
        ),
        FForm(
          text: 'Email',
          onChanged: handleMail,
          error: mailErr,
          autofocus: true,
          // icon: Icons.lock,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        Container(
          alignment: Alignment.center,
          child: isButtonActive
              ? CircularProgressIndicator()
              : RaisedButton(
                  onPressed: handleSendActivationCode,
                  child: Text(
                    "Send Activation Code",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
        )
      ],
    );
  }
}
