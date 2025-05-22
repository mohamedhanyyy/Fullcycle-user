import 'package:flutter/material.dart';

class AppNavigation {
  static void navigate(Widget page) {
    Navigator.of(navigatorKey.currentContext!)
        .push(MaterialPageRoute(builder: (context) => page));
  }

  static void navigateReplacement(Widget page) {
    Navigator.of(navigatorKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  static void pop() {
    Navigator.of(navigatorKey.currentContext!).pop();
  }

  static void navigateOffAll(Widget page) {
    Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
}
