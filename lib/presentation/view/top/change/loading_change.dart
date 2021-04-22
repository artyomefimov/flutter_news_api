import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';
import 'package:mwwm/mwwm.dart';

class LoadingChange extends FutureChange<ResultWrapper<News>> {
  final TopFilter filter;

  LoadingChange({required this.filter});
}
