import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/presentation/view/top/change/loading_change.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart' as r;

class TopHighlightsWidgetModel extends WidgetModel {
  TopHighlightsWidgetModel(
    TopFilterInteractor topFilterInteractor,
    WidgetModelDependencies baseDependencies,
    Model model,
  ) : super(baseDependencies, model: model) {
    _filterInteractor = topFilterInteractor;
    _subscribeOnFilterUpdates();
  }

  late final TopFilterInteractor _filterInteractor;
  late TopFilter _currentFilter;
  final loadNewsState = r.EntityStreamedState<News>();

  void loadNews() async {
    await loadNewsState.loading();
    final resultWrapper =
        await model.perform(LoadingChange(filter: _currentFilter));
    resultWrapper.collect(
      onSuccess: (result) => loadNewsState.content(result),
      onError: (errorMessage) => loadNewsState.error(errorMessage),
    );
  }

  void _subscribeOnFilterUpdates() => subscribe<TopFilter>(
        _filterInteractor.getTopFilterBroadcast(),
        (filter) {
          _currentFilter = filter;
          loadNews();
        },
      );
}
