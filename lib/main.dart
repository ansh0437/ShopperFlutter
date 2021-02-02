import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // remove the comment for this line
import 'package:provider/provider.dart';
import 'package:shopper/localization/app_translation_delegate.dart';
import 'package:shopper/notifiers/app_notifier.dart';
import 'package:shopper/app/navigator.dart';
import 'package:shopper/constants/pages.dart';
import 'package:shopper/data/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Loading shared preferences
  await SharedPref.load();

  runApp(ChangeNotifierProvider<AppNotifier>(
    create: (_) => AppNotifier(),
    child: ShopperApp(),
  ));
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
      title: 'Shopper',
      debugShowCheckedModeBanner: false,
      theme: appNotifier.getTheme(),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        // AppLocalizations.delegate, // remove the comment for this line
        AppTranslationsDelegate(newLocale: appNotifier.getLocale()),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('hi', ''), // Hindi
      ],
      initialRoute: Pages.dashboard,
      routes: ShopperNavigator.routes,
    );
  }
}
