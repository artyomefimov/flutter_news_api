import 'package:flutter_news_api/domain/model/filter/everything/everything_filter.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';
import 'package:mwwm/mwwm.dart';

class LoadingChange extends FutureChange<ResultWrapper<News>> {
  final EverythingFilter filter;
  final String quoteInTitle;
  final int pageSize;
  final int pageNum;

  LoadingChange({
    required this.filter,
    required this.quoteInTitle,
    required this.pageSize,
    required this.pageNum,
  });
}
