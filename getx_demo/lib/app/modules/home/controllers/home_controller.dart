import 'package:get/get.dart';
import 'package:getx_demo/app/modules/home/providers/UserProvider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  final RxInt count = 0.obs; // RxInt(0);
  void increment() {
    count.value++;
    print(count.value);
  }

  final UserProvider _userProvider = UserProvider();
  @override
  void onInit() {
    print('[---ok---] HomeController has been created!');

    _userProvider.getUsers().then((response) {
      print(response);
      change(response, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    count.value = 10;
    super.onInit();
  }

  @override
  void onClose() {
    print('[---ok---] HomeController has been closed!');

    count.value = 0;
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
