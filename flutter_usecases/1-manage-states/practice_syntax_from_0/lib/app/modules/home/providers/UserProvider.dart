/*
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  Future<List<dynamic>> getUsers() async {
    final response = await get('https://randomuser.me/api/?results=20');

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['results'];
    }
  }
}
*/
