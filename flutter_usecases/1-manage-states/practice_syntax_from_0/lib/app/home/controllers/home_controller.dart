import 'package:get/get.dart';
import '../providers/home_data_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  RxInt count = 0.obs;

  void increment() {
    count.value++;
    print('[---ok---] ${count.value}');
  }

  HomeDataProvider _homeDataProvider = new HomeDataProvider();

  @override
  void onInit() {
    print("HomeController has been created!!!");
    count.value = 10;

    // Req process res data
    _homeDataProvider.getHomeData().then((response) => {
      print('[---ok---] response ${response}'),
      change(response, status: RxStatus.success()),
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    print("HomeController has been closed!!!");
    count.value = 0;
    super.onClose();
  }
}