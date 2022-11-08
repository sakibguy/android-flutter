import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/views/home_view.dart';
import '../home/binding/home_binding.dart';
import '../login/views/login_view.dart';

part 'app_route.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeView(),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginView(),
    ),
    GetPage(name: Routes.SIGNUP, page: () => Container())
  ];
}