import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/app/pages/base/base.dart';
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
    _darkMode = ShopperPreference.darkMode.getBoolean();
    _hindiLanguage = ShopperPreference.hindiLanguage.getBoolean();
  }

  void onThemeChange(bool value) {
    ShopperPreference.darkMode.save(value);
    setState(() {
      _darkMode = ShopperPreference.darkMode.getBoolean();
      _appNotifier.changeTheme();
    });
  }

  void onLanguageChange(bool value) {
    ShopperPreference.hindiLanguage.save(value);
    setState(() {
      _hindiLanguage = ShopperPreference.hindiLanguage.getBoolean();
      _appNotifier.changeLanguage();
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
