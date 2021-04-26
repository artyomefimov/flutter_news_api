import 'package:flutter_news_api/domain/model/filter/everything/everything_filter.dart';

abstract class EverythingFilterInteractor {
  Future<void> resolveInitialFilter();
  Future<void> changeLanguage(String languageName);
  Future<void> changeSortBy(String value);
  Stream<EverythingFilter> getEverythingFilterBroadcast();
}