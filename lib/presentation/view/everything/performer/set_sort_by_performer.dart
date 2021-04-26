import 'package:flutter_news_api/domain/interactor/filter/everything/everything_filter_interactor.dart';
import 'package:flutter_news_api/presentation/view/everything/change/set_sort_by_change.dart';
import 'package:mwwm/mwwm.dart';

class SetSortByPerformer extends FuturePerformer<void, SetSortByChange> {
  late final EverythingFilterInteractor interactor;

  SetSortByPerformer({required this.interactor});

  @override
  Future<void> perform(SetSortByChange change) =>
      interactor.changeSortBy(change.value);
}