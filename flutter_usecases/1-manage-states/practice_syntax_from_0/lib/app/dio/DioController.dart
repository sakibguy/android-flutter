// import 'package:dio/dio.dart';
// import 'DioModel.dart';
//
// class DioController {
//   // target api access
//   static const _apiKey = "f597071adb2b4ffdae9af5b19b5ee92c";
//   static const _url = "https://newsapi.org/v2/everything?q=tesla&from=2022-09-24&sortBy=publishedAt&apiKey=$_apiKey";
//
//   Dio? _dio;
//   DioController () {
//     _dio = Dio();
//   }
//
//   Future<List<Article>> fetchNewsData() async {
//     try {
//       Response? response = await _dio?.get(_url);
//       DioModel dioModel = DioModel.fromJson(response?.data);
//       return dioModel.articles;
//     } on DioError catch(e) {
//       print(e);
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'DioModel.dart';
// import 'package:network_request_flutter/models/NewsReponse.dart';

class DioController {
  // static String _apiKey = "031edd538b0445bba2ce45d5838b4a75";
  static const String _apiKey = "f597071adb2b4ffdae9af5b19b5ee92c";
  static const String _url =
      "https://newsapi.org/v2/everything?q=tesla&from=2022-09-27&sortBy=publishedAt&apiKey=$_apiKey";
  Dio? _dio;

  DioController() {
    _dio = Dio();
  }

  // Future<List<Article>> fetchNewsArticle() async {
  //   try {
  //     Response? response = await _dio?.get(_url);
  //     DioModel newsResponse = DioModel.fromJson(response?.data);
  //     return newsResponse.articles;
  //   } on DioError catch (e) {
  //     print(e);
  //   }
  // }

  Future<List<Article>> fetchNewsArticle() async {
    try {
      Response? response = await _dio?.get(_url);
      print('[---ok---] nr $response');
      DioModel newsResponse = DioModel.fromJson(response?.data);
      return newsResponse.articles;
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }
}
