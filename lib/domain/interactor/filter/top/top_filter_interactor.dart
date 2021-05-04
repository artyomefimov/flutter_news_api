import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';

abstract class TopFilterInteractor {
  Future<void> changeCountryName(String countryName);
  Future<void> changeCategoryValue(String categoryValue);
  Stream<TopFilter> getTopFilterBroadcast();
}