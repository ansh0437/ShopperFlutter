import 'package:flutter/material.dart';

abstract class BasePageStateless extends StatelessWidget {
  BasePageStateless({Key key}) : super(key: key);
}

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<T extends BasePage> extends State<T> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double getWidth() => MediaQuery.of(context).size.width;

  double getHeight() => MediaQuery.of(context).size.height;

  Future<bool> willPop() async {
    return true;
  }

  Future<bool> disablePop() async {
    return false;
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  void push(String routeName, {Object data}) {
    Navigator.of(context).pushNamed(routeName, arguments: data);
  }

  void pushReplacement(String routeName, {Object data}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: data);
  }

  void popPush(String routeName, {Object data}) {
    Navigator.of(context).popAndPushNamed(routeName, arguments: data);
  }

  void pushClear(String routeName, {Object data}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: data);
  }
}
