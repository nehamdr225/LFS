import 'package:flutter/material.dart';
import 'package:uno/widget/atoms/form.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
          body: Container(
        width: screenWidth* 0.90,
        child: Column(
          children: <Widget>[
            FLogo(),
            FText(),
            FForm(text: 'Id', obscure: false, keyboardType: 'textType'),
          ],
        ),
      ),
    );
  }
}