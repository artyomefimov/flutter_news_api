import 'package:flutter_news_api/domain/model/filter/everything/language.dart';
import 'package:flutter_news_api/domain/model/filter/everything/sort_by.dart';

class EverythingFilter {
  late final Language language;
  late final SortBy sortBy;

  EverythingFilter({
    required this.language,
    required this.sortBy,
  });
}
