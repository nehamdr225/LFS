import 'package:flutter/material.dart';
import 'package:LFS/constants/colors.dart' as consts;


class FTheme with ChangeNotifier {
  ThemeData darkTheme = ThemeData.dark();
  ThemeData _themeData;
  bool isDark = false;
  ThemeData lightTheme = _buildLightTheme();

  static ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: consts.primary,
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme, consts.p_dark),
      accentIconTheme: base.iconTheme.copyWith(color: consts.lfsWhite),
      primaryIconTheme: base.iconTheme.copyWith(color: consts.p_dark),
      buttonColor: consts.primary,
      accentColor: consts.p_dark,
      scaffoldBackgroundColor: consts.lfsWhite,
      cardColor: Colors.white,
      textSelectionColor: consts.primary,
      errorColor: consts.errorColor,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.accent,
      ),
      textSelectionHandleColor: consts.primary,
      accentTextTheme: _buildTextTheme(base.accentTextTheme, consts.p_dark),
      textTheme: _buildTextTheme(base.textTheme, consts.p_dark),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base, Color color) {
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
        )
        .apply(
            fontFamily: 'Crimson',
            displayColor: color,
            bodyColor: consts.lfsWhite);
  }

  FTheme() {
    _themeData = lightTheme;
  }

  ThemeData getTheme() => _themeData;

  setTheme() {
    if (!isDark) {
      _themeData = darkTheme;
    } else {
      _themeData = lightTheme;
    }

    isDark = !isDark;
    notifyListeners();
  }
}
