import 'package:flutter_news_api/data/model/article.dart';
import 'package:flutter_news_api/data/model/news_response.dart';
import 'package:flutter_news_api/domain/mapper/mapper.dart';
import 'package:flutter_news_api/domain/model/article.dart';
import 'package:flutter_news_api/domain/model/news.dart';
import 'package:intl/intl.dart';

class NewsMapper implements Mapper<NewsResponse, News> {
  final _dateFormat = DateFormat('yyyy-MM-dd hh:mm');

  @override
  News map(NewsResponse from) => News(
        totalResults: from.totalResults,
        articles: _toArticle(from.articles),
      );

  List<Article> _toArticle(List<ArticleDto> dtoArticles) =>
      List.generate(dtoArticles.length, (index) {
        final item = dtoArticles[index];
        return Article(
          sourceName: item.source.name,
          author: item.author,
          title: item.title,
          description: item.description,
          url: item.url,
          urlToImage: item.urlToImage,
          publishDate: _dateFormat.parse(item.publishedAt).toString(),
          content: item.content,
        );
      });
}
