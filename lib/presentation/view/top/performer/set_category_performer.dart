import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor.dart';
import 'package:flutter_news_api/presentation/view/top/change/set_category_change.dart';
import 'package:mwwm/mwwm.dart';

class SetCategoryPerformer extends FuturePerformer<void, SetCategoryChange> {
  late final TopFilterInteractor interactor;

  SetCategoryPerformer({required this.interactor});

  @override
  Future<void> perform(SetCategoryChange change) =>
      interactor.changeCategoryValue(change.categoryValue);
}