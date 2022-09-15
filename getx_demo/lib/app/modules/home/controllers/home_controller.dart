import 'package:get/get.dart';

class HomeController extends GetxController{

  final RxInt count = 0.obs;  // RxInt(0);
  void increment() => count.value++;


  @override
  void onInit() {
    count.value = 10;
    super.onInit();
  }

  @override
  void onClose() {
    count.value = 0;
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}