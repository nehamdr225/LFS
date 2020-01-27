import 'package:LFS/pages/NavigationPage.dart';
import 'package:LFS/state/cards.dart';
import 'package:LFS/state/merchants.dart';
import 'package:LFS/state/store.dart';
// import 'package:LFS/state/store.dart';
import 'package:LFS/state/user.dart';
import 'package:LFS/state/theme.dart';
import 'package:LFS/pages/UserPrompt.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(BootStrapper(token: await getValue("token")));
}

class BootStrapper extends StatelessWidget {
  final String token;
  BootStrapper({this.token});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => FTheme()),
        ChangeNotifierProvider(builder: (context) => MerchantsModel()),
        ChangeNotifierProvider(builder: (context) => UserModel()),
        ChangeNotifierProvider(builder: (context) => CardsModel())
      ],
      child: LfsApp(token: token),
    );
  }
}

class LfsApp extends StatelessWidget {
  final String token;
  LfsApp({this.token});
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<FTheme>(context).getTheme();
    return MaterialApp(
      home: token != null ? NavigationPage() : UserPrompt(),
      debugShowCheckedModeBanner: false,
      theme: theme,
    );
  }
}
