import 'package:LFS/pages/signinNsignup/UserPrompt.dart';
import 'package:flutter/material.dart';

void main()=> runApp(
  HomePage()
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserPrompt(),
      debugShowCheckedModeBanner: false,
    );
  }
}