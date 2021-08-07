import 'package:dio/dio.dart';
import 'package:news_app/constant/news_constant.dart';
import 'package:news_app/model/news_model.dart';
import 'dart:core';

import 'package:news_app/viewmodel/news_view_model.dart';

class WebService {
  var dio = Dio();

  Future<List<NewsModelArticle>> getTopHeadlines() async {
    final response = await dio.get(Constant.topHeadlineByCountry());
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];

      return list.map((article) => NewsModelArticle.fromJson(article)).toList();
    }
    else{
      throw Exception("RESPONSE UNSUCCESSFUL");
    }
  }
  Future<List<NewsModelArticle>> getNewsByCountry(String country) async {
    final response = await dio.get(Constant.topHeadlineByCountry(country));
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];

      return list.map((article) => NewsModelArticle.fromJson(article)).toList();
    }
    else{
      throw Exception("RESPONSE UNSUCCESSFUL");
    }
  }
}
