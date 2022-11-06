// import 'package:get/get.dart';
// import 'package:practice_syntax_from_0/app/modules/home/controllers/home_controller.dart';
//
// class HomeBinding extends Bindings {
//   @override
//   void dependencies() {
//     // TODO: implement dependencies
//     // Get.put(HomeController());
//     Get.lazyPut(() => HomeController());
//     // Get.find<HomeController>();
//   }
// }

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.put(HomeController());
    Get.lazyPut(() => HomeController());
    // Get.find<HomeController>();
  }
}