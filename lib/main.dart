import 'package:LFS/pages/signinNsignup/UserPrompt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './state/theme.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<FTheme>(context).getTheme();
    return MaterialApp(
      home: UserPrompt(),
      debugShowCheckedModeBanner: false,
      theme: theme,
    );
  }
}
