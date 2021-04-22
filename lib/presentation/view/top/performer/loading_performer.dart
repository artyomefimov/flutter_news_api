import 'package:flutter_news_api/domain/interactor/news_interactor.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';
import 'package:flutter_news_api/presentation/view/top/change/loading_change.dart';
import 'package:mwwm/mwwm.dart';

class LoadingPerformer extends FuturePerformer<ResultWrapper<News>, LoadingChange> {
  LoadingPerformer({required this.interactor});

  final NewsInteractor interactor;

  @override
  Future<ResultWrapper<News>> perform(LoadingChange change) =>
      interactor.getTopArticles(change.country, change.category);
}