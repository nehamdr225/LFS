import 'package:LFS/widget/atoms/FLogo.dart';
import 'package:LFS/widget/atoms/PasswordForm.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  final handlePassword, handleChangePassword;
  final passwordErr, isButtonActive;
  const ChangePassword(
      {Key key,
      this.handleChangePassword,
      this.handlePassword,
      this.isButtonActive,
      this.passwordErr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: FLogo(text: ''),
        ),
        PasswordForm(
          text: 'Password',
          onChanged: handlePassword,
          error: passwordErr,
          // icon: Icons.lock,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        PasswordForm(
          text: 'Password Again',
          onChanged: handlePassword,
          error: passwordErr,
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
                  onPressed: handleChangePassword,
                  child: Text(
                    "Change Password",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
        )
      ],
    );
  }
}
