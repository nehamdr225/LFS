import 'package:flutter/material.dart';
import 'package:uno/pages/registration.dart';

void main()=> runApp(
  HomePage()
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Registration(),
      debugShowCheckedModeBanner: false,
    );
  }
}