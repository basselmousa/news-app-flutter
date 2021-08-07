import 'package:intl/intl.dart';
import 'package:news_app/model/news_model.dart';

class NewsViewModel{
  NewsModelArticle _newsViewModel;

  NewsViewModel({required NewsModelArticle newsModelArticle}) : _newsViewModel = newsModelArticle;

  String get title {
    return _newsViewModel.title;
  }

  String get description {
    return _newsViewModel.description;
  }

  String get url {
    return _newsViewModel.url;
  }

  String get publishedAt {
    final dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(_newsViewModel.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime);
  }

  String get urlToImage {
    return _newsViewModel.urlToImage;
  }


}