import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/app/pages/base/base.dart';
import 'package:shopper/data/preferences.dart';
import 'package:shopper/localization/app_translation.dart';

import '../../../notifiers/app_notifier.dart';

class Settings extends BasePage {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends BaseState<Settings> {
  bool darkTheme = false;

  AppNotifier _appNotifier;

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  void getTheme() {
    darkTheme = ShopperPreference.darkMode.getBoolean();
  }

  void onChange(bool value) {
    ShopperPreference.darkMode.save(value);
    setState(() {
      darkTheme = ShopperPreference.darkMode.getBoolean();
      _appNotifier.changeTheme();
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
          title: Text("Settings"),
        ),
        body: Container(
          child: Center(
            child: Row(
              children: [
                // Text("Change App Theme"),
                Text(AppTranslations.of(context).text("change_app_theme")),
                Switch(
                  value: darkTheme,
                  onChanged: onChange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
