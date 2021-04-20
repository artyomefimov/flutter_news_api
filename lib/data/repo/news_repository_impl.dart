import 'dart:developer';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter_news_api/data/api/news_api.dart';
import 'package:flutter_news_api/data/model/news_response.dart';
import 'package:flutter_news_api/domain/mapper/mapper.dart';
import 'package:flutter_news_api/domain/model/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';
import 'package:flutter_news_api/domain/repo/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  static const String apiKey = "API_KEY";
  static const String _token = "e0d5578ef7c1420bb4c76725d389b570";
  late final NewsApi _api;
  late final Mapper<NewsResponse, News> _articlesMapper;

  NewsRepositoryImpl({required NewsApi api, required Mapper<NewsResponse, News> articlesMapper}) {
    _api = api;
    _articlesMapper = articlesMapper;
    EncryptedSharedPreferences().setString(apiKey, _token);
  }

  @override
  Future<ResultWrapper<News>> getTopArticles(String? country, String? category) async {
    try {
      final response = await _api.getTopArticles(country, category);
      return ResultWrapper.success(_articlesMapper.map(response));
    } catch (error, stacktrace) {
      log("Exception occurred: $error stackTrace: $stacktrace");
      return ResultWrapper.error(error.toString());
    }
  }
}
