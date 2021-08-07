class NewsModelArticle {
  String title, publishedAt, description, url, urlToImage;

  NewsModelArticle({title, publishedAt, description, url, urlToImage})
      : title = title,
        publishedAt = publishedAt,
        description = description,
        url = url,
        urlToImage = urlToImage;

   factory NewsModelArticle.fromJson(Map<String, dynamic> json){
    return NewsModelArticle(
      title: json['title'],
      description: json['description'],
      url:  json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }

}
