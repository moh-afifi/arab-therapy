import 'package:flutter/material.dart';

class AppNavigator {
  static Future<void> push({
    required BuildContext context,
    required Widget widget,
    required String route,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: route),
        builder: (context) => widget,
      ),
    );
  }

  static Future<void> pushReplacement({
    required BuildContext context,
    required Widget widget,
    required String route,
  }) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: route),
        builder: (context) => widget,
      ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void pushAndRemoveUntil({
    required BuildContext context,
    required Widget widget,
    required String route,
  }) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          settings: RouteSettings(name: route),
          builder: (BuildContext context) {
            return widget;
          },
        ),
        (Route<dynamic> route) => false);
  }
}
