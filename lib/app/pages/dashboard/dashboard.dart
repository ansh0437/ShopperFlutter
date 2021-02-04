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
        // appBar: AppBar(
        //   title: Text(LocalizedStrings.of(context).dashboard),
        // ),
        bottomNavigationBar: SafeArea(
          child: BottomNavyBar(
            selectedIndex: _currentIndex,
            onItemSelected: (index) => setState(() {
              _currentIndex = index;
            }),
            items: [
              BarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.red,
              ),
              BarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: Colors.purple,
              ),
              // BarItem(
              //   icon: Icon(Icons.message),
              //   title: Text('Messages'),
              //   activeColor: Colors.green,
              // ),
              BarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
        body: SafeArea(
          top: false,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(LocalizedStrings.of(context).dashboard),
                    centerTitle: true,
                    background: Container(color: Colors.red),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.settings),
                      tooltip: LocalizedStrings.of(context).settings,
                      onPressed: () => pushPage(Pages.settings),
                    ),
                  ],
                )
              ];
            },
            body: Container(child: Column(children: [])),
          ),
        ),
      ),
    );
  }
}
