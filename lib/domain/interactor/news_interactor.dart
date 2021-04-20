import 'package:flutter_news_api/domain/model/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';

abstract class NewsInteractor {
  Future<ResultWrapper<News>> getTopArticles(
    String? country,
    String? category,
  );
}
