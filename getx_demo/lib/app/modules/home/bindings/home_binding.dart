import 'package:get/get.dart';
import 'package:getx_demo/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeController(), permanent: true);

    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.find<HomeController>();
  }
}
