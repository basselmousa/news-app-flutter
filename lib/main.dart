import 'package:flutter/material.dart';
import 'package:news_app/screen/mainscreen.dart';
import 'package:news_app/viewmodel/list_news_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [

        ChangeNotifierProvider(
          create: (cont) => ListNewsViewModel(),
        )

    ],child: MyApp(),)

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsScreen(),

    );
  }
}
