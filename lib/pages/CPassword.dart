import 'package:flutter/material.dart';
import 'package:uno/widget/atoms/FButton.dart';
import 'package:uno/widget/atoms/FForm.dart';
import 'package:uno/widget/atoms/FLogo.dart';

class CPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: screenWidth * 0.80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FLogo(
                  text: '',
                ),
                FForm(
                  text: 'Password',
                  obscure: true,
                  type: TextInputType.text,
                  icon: Icons.lock,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                FForm(
                  text: 'Confirm Password',
                  obscure: true,
                  type: TextInputType.text,
                  icon: Icons.lock,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                FButton(
                  text: 'Register',
                  onPressed: () {
                    //HomePage(),
                  },
                  onTap: null,
                  info: '',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
