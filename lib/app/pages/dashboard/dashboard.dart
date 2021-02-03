import 'package:flutter/material.dart';
import 'package:shopper/app/pages/base/base_statefull.dart';
import 'package:shopper/app/widgets/bottom_navigation_bar.dart';
import 'package:shopper/constants/pages.dart';
import 'package:shopper/generated/l10n.dart';

class Dashboard extends BasePage {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends BaseState<Dashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPop,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(LocalizedStrings.of(context).dashboard),
        ),
        bottomNavigationBar: SafeArea(
          child: BottomNavyBar(
            selectedIndex: _currentIndex,
            onItemSelected: (index) => setState(() {
              _currentIndex = index;
              // _selectedIndex = index;
              // _pageController.animateToPage(index,
              // duration: Duration(milliseconds: 300), curve: Curves.ease);
            }),
            items: [
              BarItem(
                icon: Icon(Icons.apps),
                title: Text('Home'),
                activeColor: Colors.red,
                // inactiveColor: Theme.of(context).accentColor,
              ),
              BarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: Colors.purple,
                // inactiveColor: Theme.of(context).accentColor,
              ),
              // BarItem(
              //   icon: Icon(Icons.message),
              //   title: Text('Messages'),
              //   activeColor: Colors.green,
              //   // inactiveColor: Theme.of(context).accentColor,
              // ),
              BarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.blue,
                // inactiveColor: Theme.of(context).accentColor,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  child: Text(LocalizedStrings.of(context).openSettings),
                  onPressed: () {
                    pushPage(Pages.settings);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
