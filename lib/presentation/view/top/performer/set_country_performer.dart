import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor.dart';
import 'package:mwwm/mwwm.dart';
import 'package:flutter_news_api/presentation/view/top/change/set_country_change.dart';

class SetCountryPerformer extends FuturePerformer<void, SetCountryChange> {
  late final TopFilterInteractor interactor;

  SetCountryPerformer({required this.interactor});

  @override
  Future<void> perform(SetCountryChange change) =>
      interactor.changeCountryName(change.countryName);
}