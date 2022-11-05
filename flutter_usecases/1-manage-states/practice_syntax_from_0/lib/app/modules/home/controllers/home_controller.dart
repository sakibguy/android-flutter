import 'package:get/get.dart';

class HomeController extends GetxController {
  // RxInt count = 0.obs;
  RxInt count = RxInt(0);

  late RxInt rxInt;
  late RxDouble rxDouble;
  late RxList rxList;

  void increment() => count.value++;

  @override
  void onInit() {
    count.value = 10;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    count.value = 0;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}