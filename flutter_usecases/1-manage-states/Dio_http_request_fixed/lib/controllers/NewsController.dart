import 'package:dio/dio.dart';
import 'package:network_request_flutter/models/NewsReponse.dart';

class NewsController {
  // static String _apiKey = "031edd538b0445bba2ce45d5838b4a75";
  static String _apiKey = "f597071adb2b4ffdae9af5b19b5ee92c";
  String _url =
      "https://newsapi.org/v2/everything?q=tesla&from=2022-09-24&sortBy=publishedAt&apiKey=$_apiKey";
  Dio _dio;

  NewsController() {
    _dio = Dio();
  }

  Future<List<Article>> fetchNewsArticle() async {
    try {
      Response response = await _dio.get(_url);
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles;
    } on DioError catch (e) {
      print(e);
    }
  }
}
