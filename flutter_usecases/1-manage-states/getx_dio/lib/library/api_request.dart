import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;

  ApiRequest({
    required this.url,
    this.data,
  });

  Dio _dio() {
    return Dio(BaseOptions(headers: {
      // Put authorization token here
      'Authorization': 'B .....',
    }));
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic err)? onError,
  }) {
    _dio().get(this.url, queryParameters: this.data).then((res) {
      if (onSuccess != null) {
        onSuccess(res.data);
      }
    }).catchError((error) {
      if(onError != null) {
        onError(error);
      }
    });
  }
}