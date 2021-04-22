import 'package:flutter_news_api/data/model/article.dart';
import 'package:flutter_news_api/data/model/news_response.dart';
import 'package:flutter_news_api/domain/mapper/mapper.dart';
import 'package:flutter_news_api/domain/model/news/article.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:intl/intl.dart';

class NewsMapper implements Mapper<NewsResponse, News> {
  final _dateFormat = DateFormat('dd MMMM yyyy hh:mm');

  @override
  News map(NewsResponse from) => News(
        totalResults: from.totalResults,
        articles: _toArticle(from.articles),
      );

  List<Article> _toArticle(List<ArticleDto> dtoArticles) =>
      List.generate(dtoArticles.length, (index) {
        final item = dtoArticles[index];
        final publishDate = item.publishedAt != null
            ? _dateFormat.format(DateTime.parse(item.publishedAt!))
            : "";
        return Article(
          sourceName: item.source?.name ?? "",
          author: item.author ?? "",
          title: item.title ?? "",
          description: item.description ?? "",
          url: item.url ?? "",
          urlToImage: item.urlToImage ?? "",
          publishDate: publishDate,
          content: item.content ?? "",
        );
      });
}
