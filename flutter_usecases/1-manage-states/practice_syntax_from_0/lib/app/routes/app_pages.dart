import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => Container()),
    GetPage(name: _Paths.LOGIN, page: () => Container()),
    GetPage(name: _Paths.SIGNUP, page: () => Container()),
  ];
}