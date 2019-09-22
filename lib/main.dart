import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:LFS/pages/signinNsignup/UserPrompt.dart';
import 'package:LFS/state/theme.dart';

void main() => runApp(BootStrapper());

class BootStrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(builder: (context) => FTheme())],
      child: LfsApp(),
    );
  }
}

class LfsApp extends StatelessWidget {
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
