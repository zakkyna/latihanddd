import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<dynamic> to(Widget route) {
  return navigatorKey.currentState!
      .push(MaterialPageRoute(builder: (BuildContext context) => route));
}

Future<dynamic> off(Widget route) {
  return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => route),
      (Route<dynamic> route) => false);
}

Future goBack([dynamic result]) async {
  return navigatorKey.currentState!.pop(result);
}

Future pushReplacement(Widget route) async {
  return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => route));
}
