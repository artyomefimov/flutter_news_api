import 'package:flutter_news_api/domain/model/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';
import 'package:mwwm/mwwm.dart';

class LoadingChange extends FutureChange<ResultWrapper<News>> {
  final String? country;
  final String? category;

  LoadingChange({this.country, this.category});
}
