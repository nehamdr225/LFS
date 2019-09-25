import 'package:LFS/state/cards.dart';
import 'package:LFS/state/merchants.dart';
import 'package:LFS/state/user.dart';
import 'package:LFS/state/theme.dart';
import 'package:LFS/pages/UserPrompt.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(BootStrapper());

class BootStrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => FTheme()),
        ChangeNotifierProvider(builder: (context) => MerchantsModel()),
        ChangeNotifierProvider(builder: (context) => UserModel()),
        ChangeNotifierProvider(builder: (context) => CardsModel())
      ],
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
