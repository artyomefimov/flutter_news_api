import 'package:flutter_news_api/domain/model/filter/top/category.dart';
import 'package:flutter_news_api/domain/model/filter/top/country.dart';

class TopFilter {
  late final Country country;
  late final Category category;

  TopFilter({
    required this.country,
    required this.category,
  });
}
