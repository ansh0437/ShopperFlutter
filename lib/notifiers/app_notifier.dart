import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopper/app/theme/app_theme.dart';
import 'package:shopper/data/preferences.dart';

class AppNotifier with ChangeNotifier {
  bool _darkMode = false;
  bool _hindiLanguage = false;

  AppNotifier() {
    _darkMode = ShopperPreference.darkMode.boolean;
    _hindiLanguage = ShopperPreference.hindiLanguage.boolean;
  }

  ThemeData get theme => _darkMode ? darkTheme : lightTheme;

  Locale get locale => _hindiLanguage ? Locale("hi") : Locale("en");

  changeTheme() {
    _darkMode = ShopperPreference.darkMode.boolean;
    notifyListeners();
  }

  changeLanguage() {
    _hindiLanguage = ShopperPreference.hindiLanguage.boolean;
    notifyListeners();
  }
}
