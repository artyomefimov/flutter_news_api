import 'package:flutter_news_api/data/model/source.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class ArticleDto {
  late final Source? source;
  late final String? author;
  late final String? title;
  late final String? description;
  late final String? url;
  late final String? urlToImage;
  late final String? publishedAt;
  late final String? content;

  ArticleDto({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDtoToJson(this);
}
