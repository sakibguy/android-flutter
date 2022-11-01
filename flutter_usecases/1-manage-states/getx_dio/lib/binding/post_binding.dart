import 'package:get/get.dart';

import '../posts/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PostController>(() => PostController());
  }
}