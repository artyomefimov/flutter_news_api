
import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/main_screen.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.newsApp,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MainScreen(),
    );
  }
}
