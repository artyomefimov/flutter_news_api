import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/presentation/view/top/change/get_filter_change.dart';
import 'package:mwwm/mwwm.dart';

class GetFilterPerformer extends StreamPerformer<TopFilter, GetFilterChange> {
  late final TopFilterInteractor interactor;

  GetFilterPerformer({required this.interactor});

  @override
  Stream<TopFilter> perform(GetFilterChange change) =>
      interactor.getTopFilterBroadcast();
}