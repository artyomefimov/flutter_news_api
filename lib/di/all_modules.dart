import 'package:dio/dio.dart';
import 'package:flutter_news_api/data/api/interceptor/auth_interceptor.dart';
import 'package:flutter_news_api/data/api/news_api.dart';
import 'package:flutter_news_api/data/api/token/token_holder.dart';
import 'package:flutter_news_api/data/mapper/news_mapper.dart';
import 'package:flutter_news_api/data/model/news_response.dart';
import 'package:flutter_news_api/data/repo/news_repository_impl.dart';
import 'package:flutter_news_api/domain/interactor/filter/everything/everything_filter_interactor.dart';
import 'package:flutter_news_api/domain/interactor/filter/everything/everything_filter_interactor_impl.dart';
import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor.dart';
import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor_impl.dart';
import 'package:flutter_news_api/domain/interactor/news_interactor.dart';
import 'package:flutter_news_api/domain/interactor/news_interactor_impl.dart';
import 'package:flutter_news_api/domain/mapper/mapper.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/domain/repo/news_repository.dart';
import 'package:flutter_news_api/presentation/view/everything/performer/loading_performer.dart';
import 'package:flutter_news_api/presentation/view/everything/performer/set_language_performer.dart';
import 'package:flutter_news_api/presentation/view/everything/performer/set_search_query_performer.dart';
import 'package:flutter_news_api/presentation/view/everything/performer/set_sort_by_performer.dart';
import 'package:flutter_news_api/presentation/view/everything/wm/all_news_widget_model.dart';
import 'package:flutter_news_api/presentation/view/everything/wm/everything_filter_widget_model.dart';
import 'package:flutter_news_api/presentation/view/top/performer/loading_performer.dart';
import 'package:flutter_news_api/presentation/view/top/performer/set_category_performer.dart';
import 'package:flutter_news_api/presentation/view/top/performer/set_country_performer.dart';
import 'package:flutter_news_api/presentation/view/top/wm/top_filter_widget_model.dart';
import 'package:flutter_news_api/presentation/view/top/wm/top_highlights_widget_model.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DiModule {
  final _injector = Injector();

  void configure() {
    _dataModule();
    _domainModule();
    _presentationModule();
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
  }

  void _domainModule() {
    _injector.map<NewsInteractor>(
      (injector) => NewsInteractorImpl(
        injector.get<NewsRepository>(),
      ),
      isSingleton: true,
    );
    _injector.map<TopFilterInteractor>(
      (injector) => TopFilterInteractorImpl(),
      isSingleton: true,
    );
    _injector.map<EverythingFilterInteractor>(
      (injector) => EverythingFilterInteractorImpl(),
      isSingleton: true,
    );
  }

  void _presentationModule() {
    _injector.map<TopFilterWidgetModel>(
      (injector) => TopFilterWidgetModel(
        _injector.get<TopFilterInteractor>(),
        WidgetModelDependencies(),
        Model([
          SetCountryPerformer(
            interactor: _injector.get<TopFilterInteractor>(),
          ),
          SetCategoryPerformer(
            interactor: _injector.get<TopFilterInteractor>(),
          )
        ]),
      ),
    );
    _injector.map<TopHighlightsWidgetModel>(
      (injector) => TopHighlightsWidgetModel(
        _injector.get<TopFilterInteractor>(),
        WidgetModelDependencies(),
        Model([
          TopNewsLoadingPerformer(
            interactor: _injector.get<NewsInteractor>(),
          ),
        ]),
      ),
    );
    _injector.map<AllNewsWidgetModel>(
      (injector) => AllNewsWidgetModel(
        _injector.get<EverythingFilterInteractor>(),
        WidgetModelDependencies(),
        Model([
          AllNewsLoadingPerformer(
            interactor: _injector.get<NewsInteractor>(),
          ),
        ]),
      ),
    );
    _injector.map<EverythingFilterWidgetModel>(
      (injector) => EverythingFilterWidgetModel(
        _injector.get<EverythingFilterInteractor>(),
        WidgetModelDependencies(),
        Model([
          SetSearchQueryPerformer(
            interactor: _injector.get<EverythingFilterInteractor>(),
          ),
          SetLanguagePerformer(
            interactor: _injector.get<EverythingFilterInteractor>(),
          ),
          SetSortByPerformer(
            interactor: _injector.get<EverythingFilterInteractor>(),
          )
        ]),
      ),
    );
  }
}
