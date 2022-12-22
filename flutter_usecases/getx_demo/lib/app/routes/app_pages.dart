import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_demo/app/modules/home/bindings/home_binding.dart';
import 'package:getx_demo/app/modules/home/views/home_view.dart';
import 'package:getx_demo/app/modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(name: _Paths.LOGIN, page: () => LoginView()),
    GetPage(
        name: _Paths.SIGNUP,
        page: () => Container()), // define, call custom widget
  ];
}

// part 'app_routes.dart';
//
// class AppPages {
//   AppPages._();
//
//   static const INITIAL = Routes.HOME;

//   static final routes = [
//     GetPage(name: _Paths.HOME, page: () => const HomeView()),
//     GetPage(name: _Paths.LOGIN, page: () => Container(
//       child: Text("Container Widget"),
//     )),
//     GetPage(name: _Paths.SIGNUP, page: () => Container())
//   ];
// }
