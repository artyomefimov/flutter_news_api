import 'package:flutter_news_api/domain/interactor/filter/everything/everything_filter_interactor.dart';
import 'package:flutter_news_api/presentation/view/everything/change/set_search_query_change.dart';
import 'package:mwwm/mwwm.dart';

class SetSearchQueryPerformer extends FuturePerformer<void, SetSearchQueryChange> {
  late final EverythingFilterInteractor interactor;

  SetSearchQueryPerformer({required this.interactor});

  @override
  Future<void> perform(SetSearchQueryChange change) =>
      interactor.changeSearchQuery(change.query);
}
