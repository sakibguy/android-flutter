import 'package:dio/dio.dart';

import '../model/news_response.dart';

class NewsController {
  static String apiKey = "f597071adb2b4ffdae9af5b19b5ee92c";
  String _url = "https://newsapi.org/v2/everything?q=tesla&from=2022-09-30&sortBy=publishedAt&apiKey=$apiKey";

  Dio? _dio;
  NewsController() {
    _dio = Dio();
  }

  Future<List<Article>> fetchNewsArticle() async {
    try {
      Response? response = await Dio().get(_url);
      print("[---ok---] res before: $response");
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      print("[---ok---] res after: $response");
      return newsResponse.articles;
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }
}