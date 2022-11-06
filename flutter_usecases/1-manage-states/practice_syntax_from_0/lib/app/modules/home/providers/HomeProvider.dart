import 'package:get/get.dart';

class HomeProvider extends GetConnect {

  Future<List<dynamic>> getHomeData() async {
    final response = await get("https://randomuser.me/api/?results=20");

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      print('[---ok---] res_data: ${response.body['results']}');
      return response.body['results'];
    }
  }
}