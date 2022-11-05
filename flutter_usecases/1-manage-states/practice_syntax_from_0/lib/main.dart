/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_syntax_from_0/routes/routes.dart';
import 'package:practice_syntax_from_0/views/home_view.dart';

import 'binding/home_binding.dart';

void main() => runApp(
  GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Get MA",
    getPages: [
      GetPage(
          name: Routes.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
      ),
      GetPage(name: Routes.LOGIN, page: () => Container()),
      GetPage(name: Routes.SIGNUP, page: () => Container())
    ],
    initialRoute: Routes.INITIAL,
  )
);*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    title: "GMA",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}