import 'package:flutter/material.dart';
import 'package:shopper/app/pages/base/base.dart';
import 'package:shopper/constants/pages.dart';
import 'package:shopper/generated/l10n.dart';

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
          title: Text(LocalizedStrings.of(context).dashboard),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              child: Text(LocalizedStrings.of(context).openSettings),
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
