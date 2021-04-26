import 'package:flutter_news_api/domain/interactor/filter/everything/everything_filter_interactor.dart';
import 'package:flutter_news_api/presentation/view/everything/change/resolve_initial_filter_change.dart';
import 'package:mwwm/mwwm.dart';

class ResolveAllInitialFilterPerformer extends FuturePerformer<void, ResolveInitialFilterChange> {
  late final EverythingFilterInteractor interactor;

  ResolveAllInitialFilterPerformer({required this.interactor});

  @override
  Future<void> perform(ResolveInitialFilterChange change) =>
      interactor.resolveInitialFilter();
}