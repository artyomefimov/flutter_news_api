import 'package:flutter_news_api/domain/interactor/news_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/domain/model/result_wrapper.dart';
import 'package:flutter_news_api/domain/repo/news_repository.dart';

class NewsInteractorImpl implements NewsInteractor {
  late final NewsRepository _repository;

  NewsInteractorImpl(NewsRepository repository) {
    _repository = repository;
  }

  @override
  Future<ResultWrapper<News>> getTopArticles(TopFilter filter) =>
      _repository.getTopArticles(
        filter.country.name,
        filter.category.value,
      );
}
