import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';

abstract class NewsInteractor {
  Future<ResultWrapper<News>> getTopArticles(TopFilter filter);
}
