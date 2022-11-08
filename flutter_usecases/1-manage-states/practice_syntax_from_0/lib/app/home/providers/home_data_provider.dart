import 'package:get/get.dart';

class HomeDataProvider extends GetConnect {

  Future<List<dynamic>> getHomeData() async {
    final response = await get("https://randomuser.me/api/?results=20");

    if(response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['results'];
    }
  }
}