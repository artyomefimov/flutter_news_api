import 'package:flutter_news_api/domain/interactor/news_interactor.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';
import 'package:flutter_news_api/presentation/view/everything/change/loading_change.dart';
import 'package:mwwm/mwwm.dart';

class AllNewsLoadingPerformer
    extends FuturePerformer<ResultWrapper<News>, LoadingChange> {
  AllNewsLoadingPerformer({required this.interactor});

  final NewsInteractor interactor;

  @override
  Future<ResultWrapper<News>> perform(LoadingChange change) =>
      interactor.getAllArticles(
        change.filter,
        change.quoteInTitle,
        change.pageSize,
        change.pageNum,
      );
}
