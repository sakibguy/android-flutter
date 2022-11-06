// import 'package:get/get.dart';
//
// class HomeController extends GetxController {
//   // RxInt count = 0.obs;
//   RxInt count = RxInt(0);
//
//   late RxInt rxInt;
//   late RxDouble rxDouble;
//   late RxList rxList;
//
//   void increment() => count.value++;
//
//   @override
//   void onInit() {
//     print('HomeController has been created!!!');
//
//     count.value = 10;
//     // TODO: implement onInit
//     super.onInit();
//   }
//
//   @override
//   void dispose() {
//     count.value = 0;
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//   }
//
//   @override
//   void onReady() {
//     // TODO: implement onReady
//     super.onReady();
//   }
// }

import 'package:get/get.dart';
import '../providers/HomeProvider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>>{
  RxInt count = 0.obs;
  // RxInt count = RxInt(0);

  void increment() {
    count.value++;
    print("[---ok---] HomeController has been created!!! count.value: ${count.value}");
  }

  HomeProvider _homeProvider = new HomeProvider();
  @override
  void onInit() {
    // TODO: implement onInit
    count.value = 10;

    _homeProvider.getHomeData().then((response) {
      print('[---ok---] response-homeProvider: ${response}');
      change(response, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    count.value = 0;
    super.onClose();
  }
}