// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../modules/home/binding/home_binding.dart';
// import '../modules/home/views/home_view.dart';
// import '../modules/login/views/login_view.dart';
//
// part 'app_routes.dart';
//
// class AppPages {
//   AppPages._();
//
//   static const INITIAL = Routes.HOME;
//
//   static final routes = [
//     GetPage(
//         name: _Paths.HOME,
//         page: () => HomeView(),
//         binding: HomeBinding(),
//     ),
//     GetPage(
//         name: _Paths.LOGIN,
//         page: () => LoginView()
//     ),
//     GetPage(name: _Paths.SIGNUP, page: () => Container()),
//   ];
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../modules/home/binding/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  // AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeView(),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginView()
    ),
    GetPage(name: Routes.SIGNUP, page: () => Container()),
  ];
}