import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
      GetPage(name: _Paths.HOME, page: () => Container(
        child: Text("HOME widget"),                           // define, call custom widget
      )),
      GetPage(name: _Paths.LOGIN, page: () => Container(
        child: Text("Container widget"),                      // define, call custom widget
      )),
      GetPage(name: _Paths.SIGNUP, page: () => Container()),  // define, call custom widget
  ];
}