// ignore: import_of_legacy_library_into_null_safe

// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  late final String status;
  late final int totalResults;
  late final List<ArticleDto> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
