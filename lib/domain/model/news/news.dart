import 'package:flutter_news_api/domain/model/news/article.dart';

class News {
  late final int totalResults;
  late final List<Article> articles;

  News({
    required this.totalResults,
    required this.articles,
  });
}
