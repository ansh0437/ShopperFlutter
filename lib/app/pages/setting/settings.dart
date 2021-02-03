import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/app/pages/base/base_statefull.dart';
import 'package:shopper/data/preferences.dart';
import 'package:shopper/generated/l10n.dart';

import '../../../notifiers/app_notifier.dart';

class Settings extends BasePage {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends BaseState<Settings> {
  bool _darkMode = false;
  bool _hindiLanguage = false;

  AppNotifier _appNotifier;

  @override
  void initState() {
    super.initState();
    _darkMode = ShopperPreference.darkMode.boolean;
    _hindiLanguage = ShopperPreference.hindiLanguage.boolean;
  }

  void onThemeChange(bool value) {
    ShopperPreference.darkMode.save(value);
    _appNotifier.changeTheme();
    setState(() {
      _darkMode = value;
    });
  }

  void onLanguageChange(bool value) {
    ShopperPreference.hindiLanguage.save(value);
    _appNotifier.changeLanguage();
    setState(() {
      _hindiLanguage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    _appNotifier = Provider.of<AppNotifier>(context);

    return WillPopScope(
      onWillPop: willPop,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(LocalizedStrings.of(context).settings),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(LocalizedStrings.of(context).changeAppTheme),
                  Switch(value: _darkMode, onChanged: onThemeChange),
                ],
              ),
              Row(
                children: [
                  Text(LocalizedStrings.of(context).changeAppLang),
                  Switch(value: _hindiLanguage, onChanged: onLanguageChange),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
