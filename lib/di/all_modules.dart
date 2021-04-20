import 'package:dio/dio.dart';
import 'package:flutter_news_api/data/api/interceptor/auth_interceptor.dart';
import 'package:flutter_news_api/data/api/news_api.dart';
import 'package:flutter_news_api/data/api/token/token_holder.dart';
import 'package:flutter_news_api/data/mapper/news_mapper.dart';
import 'package:flutter_news_api/data/model/news_response.dart';
import 'package:flutter_news_api/data/repo/news_repository_impl.dart';
import 'package:flutter_news_api/domain/interactor/news_interactor.dart';
import 'package:flutter_news_api/domain/interactor/news_interactor_impl.dart';
import 'package:flutter_news_api/domain/mapper/mapper.dart';
import 'package:flutter_news_api/domain/model/news.dart';
import 'package:flutter_news_api/domain/repo/news_repository.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DiModule {
  final _injector = Injector();

  void configure() {
    _dataModule();
  }

  void _dataModule() {
    _injector.map<TokenHolder>(
      (injector) => TokenHolder(),
      isSingleton: true,
    );
    _injector.map<Dio>(
      (injector) => Dio()
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: true,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        )
        ..interceptors.add(
          AuthInterceptor(
            injector.get<TokenHolder>(),
          ),
        ),
      isSingleton: true,
    );
    _injector.map<Mapper<NewsResponse, News>>(
      (injector) => NewsMapper(),
      isSingleton: true,
    );
    _injector.map(
      (injector) => NewsApi(
        injector.get<Dio>(),
      ),
      isSingleton: true,
    );
    _injector.map<NewsRepository>(
      (injector) => NewsRepositoryImpl(
        api: injector.get<NewsApi>(),
        articlesMapper: injector.get<Mapper<NewsResponse, News>>(),
      ),
      isSingleton: true,
    );
    _injector.map<NewsInteractor>(
      (injector) => NewsInteractorImpl(
        injector.get<NewsRepository>(),
      ),
      isSingleton: true,
    );
  }
}
