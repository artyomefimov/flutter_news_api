import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor.dart';
import 'package:flutter_news_api/presentation/view/top/change/resolve_initial_filter_change.dart';
import 'package:mwwm/mwwm.dart';

class ResolveInitialFilterPerformer extends FuturePerformer<void, ResolveInitialFilterChange> {
  late final TopFilterInteractor interactor;

  ResolveInitialFilterPerformer({required this.interactor});

  @override
  Future<void> perform(ResolveInitialFilterChange change) =>
      interactor.resolveInitialFilter();
}