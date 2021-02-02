import 'package:flutter/material.dart';
import 'package:shopper/app/pages/dashboard/dashboard.dart';
import 'package:shopper/app/pages/setting/settings.dart';
import 'package:shopper/constants/pages.dart';

class ShopperNavigator {
  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      Pages.dashboard: (BuildContext context) => Dashboard(),
      Pages.settings: (BuildContext context) => Settings(),
    };
  }
}
