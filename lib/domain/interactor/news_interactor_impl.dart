import 'package:flutter_news_api/domain/interactor/news_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/everything/everything_filter.dart';
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
        filter.country.code,
        filter.category.value,
      );

  @override
  Future<ResultWrapper<News>> getAllArticles(
    EverythingFilter filter,
    int pageSize,
    int pageNum,
  ) => _repository.getAllArticles(
        filter.language.code,
        filter.sortBy.value,
        pageSize,
        pageNum,
      );
}
