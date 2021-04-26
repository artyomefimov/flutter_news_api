import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/presentation/view/top/change/resolve_initial_filter_change.dart';
import 'package:flutter_news_api/presentation/view/top/change/set_category_change.dart';
import 'package:flutter_news_api/presentation/view/top/change/set_country_change.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart' as r;

class TopFilterWidgetModel extends WidgetModel {
  TopFilterWidgetModel(
    TopFilterInteractor topFilterInteractor,
    WidgetModelDependencies baseDependencies,
    Model model,
  ) : super(baseDependencies, model: model) {
    _filterInteractor = topFilterInteractor;
    _subscribeOnFilterUpdates();
  }

  late final TopFilterInteractor _filterInteractor;
  final topFilterState = r.StreamedState<TopFilter>();

  void getInitialFilter() => model.perform(
        ResolveInitialFilterChange(),
      );

  void setCountryName(String countryName) => model.perform(
        SetCountryChange(countryName: countryName),
      );

  void setCategoryValue(String categoryValue) => model.perform(
        SetCategoryChange(categoryValue: categoryValue),
      );

  void _subscribeOnFilterUpdates() =>
      _filterInteractor.getTopFilterBroadcast().listen(
            (filter) => topFilterState.accept(filter),
          );
}
