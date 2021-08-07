import 'package:flutter/material.dart';
import 'package:news_app/viewmodel/news_view_model.dart';
import 'package:news_app/widgets/circule_image.dart';

class DetailsScreen extends StatelessWidget {
  NewsViewModel article;

  DetailsScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.article.title),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Column(
          children: [
            Container(
              height: 300,
              child: CircleImage(
                imageUrl: article.urlToImage,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(article.publishedAt,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
            SizedBox(
              height: 5,
            ),

            Center(
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ), Text(
                article.description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
