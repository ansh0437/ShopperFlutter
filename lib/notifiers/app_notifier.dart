import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper/app/theme/app_theme.dart';
import 'package:shopper/data/preferences.dart';

class AppNotifier with ChangeNotifier {
  bool _darkMode = false;

  AppNotifier() {
    _darkMode = ShopperPreference.darkMode.getBoolean();
  }

  ThemeData getTheme() {
    return _darkMode ? darkTheme : lightTheme;
  }

  Locale getLocale() {
    return _darkMode ? Locale("hi") : Locale("en");
  }

  changeTheme() {
    _darkMode = ShopperPreference.darkMode.getBoolean();
    notifyListeners();
  }
}
