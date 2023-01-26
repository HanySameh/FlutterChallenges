import 'package:flutter/material.dart';

class AppConstants {
  static GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get kAppContext => kNavigatorKey.currentContext!;
  static const double kBottomNavigationHeight = 65;
  static const double kToolbarHeight = 56;
  static RegExp emailRegex =
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  static RegExp spaceRegex = RegExp(r'\s');
}
