import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';

abstract class NewsRepository {
  Future<ResultWrapper<News>> getTopArticles(
    String? country,
    String? category,
  );

  Future<ResultWrapper<News>> getAllArticles(
    String language,
    String sortBy,
    int pageSize,
    int page,
  );
}
