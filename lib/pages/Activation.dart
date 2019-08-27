import 'package:flutter/material.dart';
import 'package:uno/pages/CPassword.dart';
import 'package:uno/widget/atoms/FButton.dart';
import 'package:uno/widget/atoms/FText.dart';
import 'package:uno/widget/atoms/FForm.dart';

class Activation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
                  child: Container(
            //height: 300.0,
            width: screenWidth * 0.80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FText(
                  text: 'Activation Code',
                ),
                Padding(
                  padding: EdgeInsets.all(14.0),
                ),
                FText(
                  text:
                      'A code was sent to your email address, use that code to activate.',
                ),
                Padding(
                  padding: EdgeInsets.all(14.0),
                ),
                FForm(
                  text: 'Activation Code',
                  type: TextInputType.number,
                  obscure: false,
                  icon: Icons.lock_open,
                ),
                Padding(
                  padding: EdgeInsets.all(14.0),
                ),
                FButton(
                  text: 'Submit',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CPassword()));
                  },
                  onTap: null,
                  info: 'Resend Code',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
