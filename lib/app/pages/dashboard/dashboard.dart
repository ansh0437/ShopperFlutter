import 'package:flutter/material.dart';
import 'package:shopper/app/pages/base/base.dart';
import 'package:shopper/constants/pages.dart';
import 'package:shopper/localization/app_translation.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dashboard extends BasePage {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends BaseState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: disablePop,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              // child: Text("Open Settings"),
              child: Text(AppTranslations.of(context).text("open_settings")),
              onPressed: () {
                push(Pages.settings);
              },
            ),
          ),
        ),
      ),
    );
  }
}
