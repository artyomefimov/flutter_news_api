import 'package:flutter_news_api/domain/interactor/filter/everything/everything_filter_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/everything/everything_filter.dart';
import 'package:flutter_news_api/presentation/view/everything/change/set_language_change.dart';
import 'package:flutter_news_api/presentation/view/everything/change/set_search_query_change.dart';
import 'package:flutter_news_api/presentation/view/everything/change/set_sort_by_change.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart' as r;

class EverythingFilterWidgetModel extends WidgetModel {
  EverythingFilterWidgetModel(
    EverythingFilterInteractor filterInteractor,
    WidgetModelDependencies baseDependencies,
    Model model,
  ) : super(baseDependencies, model: model) {
    _filterInteractor = filterInteractor;
    _subscribeOnFilterUpdates();
  }

  late final EverythingFilterInteractor _filterInteractor;
  final filterState = r.StreamedState<EverythingFilter>();

  void setLanguage(String language) => model.perform(
        SetLanguageChange(language: language),
      );

  void setSortBy(String value) => model.perform(
        SetSortByChange(value: value),
      );

  void setSearchQuery(String query) => model.perform(
      SetSearchQueryChange(query: query)
  );

  void _subscribeOnFilterUpdates() {
    subscribe<EverythingFilter>(
      _filterInteractor.getEverythingFilterBroadcast(),
      (filter) => filterState.accept(filter),
    );
  }
}
