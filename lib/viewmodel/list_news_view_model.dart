import 'package:flutter/cupertino.dart';
import 'package:news_app/constant/news_constant.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/service.dart';
import 'package:news_app/viewmodel/news_view_model.dart';

enum LodingStatus { Complete, Searching, Empty }

class ListNewsViewModel with ChangeNotifier {
  LodingStatus lodingStatus = LodingStatus.Empty;

  List<NewsViewModel> articles = <NewsViewModel>[];

  // method to fetch news

  void getTopHeadlineNews() async{
    List<NewsModelArticle> _newsArticle = await WebService().getTopHeadlines();
    lodingStatus = LodingStatus.Searching;
    notifyListeners();

    this.articles = _newsArticle.map((article) => NewsViewModel(newsModelArticle: article)).toList();

    if(this.articles.isEmpty){
      lodingStatus = LodingStatus.Empty;

    }else{
      lodingStatus = LodingStatus.Complete;

    }

    notifyListeners();

  }

  void getNewsByCountry(String country) async{
    List<NewsModelArticle> _newsArticle = await WebService().getNewsByCountry(country);
    lodingStatus = LodingStatus.Searching;
    notifyListeners();

    this.articles = _newsArticle.map((article) => NewsViewModel(newsModelArticle: article)).toList();

    if(this.articles.isEmpty){
      lodingStatus = LodingStatus.Empty;

    }else{
      lodingStatus = LodingStatus.Complete;

    }

    notifyListeners();

  }
}
