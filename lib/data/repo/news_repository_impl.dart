import 'dart:developer';

import 'package:flutter_news_api/data/api/news_api.dart';
import 'package:flutter_news_api/data/model/news_response.dart';
import 'package:flutter_news_api/domain/mapper/mapper.dart';
import 'package:flutter_news_api/domain/model/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';
import 'package:flutter_news_api/domain/repo/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  late final NewsApi _api;
  late final Mapper<NewsResponse, News> _articlesMapper;

  NewsRepositoryImpl({
    required NewsApi api,
    required Mapper<NewsResponse, News> articlesMapper,
  }) {
    _api = api;
    _articlesMapper = articlesMapper;
  }

  @override
  Future<ResultWrapper<News>> getTopArticles(
    String? country,
    String? category,
  ) async {
    try {
      final response = await _api.getTopArticles(country, category);
      return ResultWrapper.success(_articlesMapper.map(response));
    } catch (error, stacktrace) {
      log("Exception occurred: $error stackTrace: $stacktrace");
      return ResultWrapper.error(error.toString());
    }
  }
}
