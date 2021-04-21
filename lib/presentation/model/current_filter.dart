import 'package:flutter_news_api/domain/model/category.dart';
import 'package:flutter_news_api/domain/model/country.dart';

class CurrentFilter {
  late final Country country;
  late final Category category;

  CurrentFilter({required this.country, required this.category});

  factory CurrentFilter.byDefault() => CurrentFilter(
        country: Country.USA,
        category: Category.BUSINESS,
      );
}
