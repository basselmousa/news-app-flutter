import 'package:flutter/material.dart';
import 'package:news_app/constant/news_constant.dart';
import 'package:news_app/viewmodel/list_news_view_model.dart';
import 'package:news_app/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      Provider.of<ListNewsViewModel>(context, listen: false).getTopHeadlineNews();
    });
    // Provider.of<ListNewsViewModel>(context, listen: false).getTopHeadlineNews();
  }

  @override
  Widget build(BuildContext context) {
    var listNewsViewModel = Provider.of<ListNewsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        elevation: 0.0,
        title: Text("News App"),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) {
              return Constant.Countries.keys
                  .map((e) => PopupMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList();
            },
            onSelected: (country) => {
              listNewsViewModel
                  .getNewsByCountry(Constant.Countries[country].toString())
            },
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
              child: Text(
                "Headlines",
                style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: NewsGrid(articles: listNewsViewModel.articles))
          ],
        ),
      ),
    );
  }
}
