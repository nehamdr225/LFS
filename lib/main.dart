import 'package:LFS/constants/colors.dart' as prefix0;
import 'package:LFS/pages/signinNsignup/UserPrompt.dart';
import 'package:flutter/material.dart';

void main()=> runApp(
  MainPage()
);

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserPrompt(),
      debugShowCheckedModeBanner: false,
      theme: _buildLightTheme(),
    );
  }
}

ThemeData _buildLightTheme(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: prefix0.primary,
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, prefix0.p_dark),
    accentIconTheme: base.iconTheme.copyWith(color: prefix0.lfsWhite),
    primaryIconTheme: base.iconTheme.copyWith(color: prefix0.p_dark),
    buttonColor: prefix0.primary,
    accentColor: prefix0.p_dark,
    scaffoldBackgroundColor: prefix0.lfsWhite,
    cardColor: Colors.white,
    textSelectionColor: prefix0.primary,
    errorColor: prefix0.errorColor ,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    textSelectionHandleColor: prefix0.primary,
    accentTextTheme: _buildTextTheme(base.accentTextTheme, prefix0.p_dark),
    textTheme: _buildTextTheme(base.textTheme, prefix0.p_dark),
  );
}

TextTheme _buildTextTheme(TextTheme base, Color color){
  return base
  .copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(fontSize: 18.0),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Crimson',
    displayColor: color,
    bodyColor: prefix0.lfsWhite
  );
}