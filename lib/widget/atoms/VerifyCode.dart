import 'package:LFS/widget/atoms/FForm.dart';
import 'package:LFS/widget/atoms/FLogo.dart';
import 'package:flutter/material.dart';

class VerifyCode extends StatelessWidget {
  final handleCode, handleVerifyCode;
  final codeErr, isButtonActive;
  const VerifyCode(
      {Key key,
      this.handleCode,
      this.handleVerifyCode,
      this.codeErr,
      this.isButtonActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: FLogo(text: ''),
        ),
        FForm(
          text: 'Activation Code',
          onChanged: handleCode,
          error: codeErr,
          autofocus: true,
          value: "",
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
                  onPressed: handleVerifyCode,
                  child: Text(
                    "Verify Activation Code",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
        )
      ],
    );
  }
}
