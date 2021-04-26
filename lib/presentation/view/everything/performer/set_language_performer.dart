import 'package:flutter_news_api/domain/interactor/filter/everything/everything_filter_interactor.dart';
import 'package:flutter_news_api/presentation/view/everything/change/set_language_change.dart';
import 'package:mwwm/mwwm.dart';

class SetLanguagePerformer extends FuturePerformer<void, SetLanguageChange> {
  late final EverythingFilterInteractor interactor;

  SetLanguagePerformer({required this.interactor});

  @override
  Future<void> perform(SetLanguageChange change) =>
      interactor.changeLanguage(change.language);
}
