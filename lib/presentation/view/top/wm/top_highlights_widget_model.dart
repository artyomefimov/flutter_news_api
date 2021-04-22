import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/presentation/view/top/change/loading_change.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart' as r;

class TopHighlightsWidgetModel extends WidgetModel {
  TopHighlightsWidgetModel(
    WidgetModelDependencies baseDependencies,
    Model model,
  ) : super(baseDependencies, model: model) {
    Injector().get<TopFilterInteractor>().getTopFilterBroadcast().listen((filter) {
      loadNews(filter);
    });
  }

  final loadNewsState = r.EntityStreamedState<News>();

  void loadNews(TopFilter filter) async {
    await loadNewsState.loading();
    final resultWrapper = await model.perform(LoadingChange(filter: filter));
    resultWrapper.collect(
      onSuccess: (result) => loadNewsState.content(result as News),
      onError: (errorMessage) => loadNewsState.error(errorMessage),
    );
  }
}
