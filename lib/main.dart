import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopper/app/navigator.dart';
import 'package:shopper/constants/pages.dart';
import 'package:shopper/data/preferences.dart';
import 'package:shopper/generated/l10n.dart';
import 'package:shopper/notifiers/app_notifier.dart';

import 'constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Loading shared preferences
  await SharedPref.load();

  runApp(
    ChangeNotifierProvider<AppNotifier>(
      create: (_) => AppNotifier(),
      child: ShopperApp(),
    ),
  );
}

class ShopperApp extends StatefulWidget {
  /// This widget is the root of your application.
  @override
  _ShopperAppState createState() => _ShopperAppState();
}

class _ShopperAppState extends State<ShopperApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appNotifier = Provider.of<AppNotifier>(context);

    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: appNotifier.theme,
      locale: appNotifier.locale,
      localizationsDelegates: [
        LocalizedStrings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocalizedStrings.delegate.supportedLocales,
      initialRoute: Pages.dashboard,
      routes: ShopperNavigator.routes,
    );
  }
}
