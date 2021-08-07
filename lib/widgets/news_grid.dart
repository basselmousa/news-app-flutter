import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/detailscreen.dart';
import 'package:news_app/viewmodel/list_news_view_model.dart';
import 'package:news_app/viewmodel/news_view_model.dart';
import 'package:news_app/widgets/circule_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsViewModel> articles;

  const NewsGrid({Key? key, required this.articles}) : super(key: key);

  void _showNewsDetailPage(BuildContext context, NewsViewModel article) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => DetailsScreen(article)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsDetailPage(context, article);
          },
          child: GridTile(
            child: Container(
              child: CircleImage(imageUrl: article.urlToImage),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis ,
              ),
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
