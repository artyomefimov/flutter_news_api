import 'package:flutter_news_api/domain/interactor/filter/everything/everything_filter_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/everything/everything_filter.dart';
import 'package:flutter_news_api/domain/model/news/article.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/presentation/view/everything/change/loading_change.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart' as r;

class AllNewsWidgetModel extends WidgetModel {
  AllNewsWidgetModel(
    EverythingFilterInteractor interactor,
    WidgetModelDependencies baseDependencies,
    Model model,
  ) : super(baseDependencies, model: model) {
    _filterInteractor = interactor;
    _subscribeOnFilterUpdates();
    pagingController.addPageRequestListener((pageKey) {
      loadNews();
    });
  }

  static const _pageSize = 20;
  static var _pageNum = 1;
  static var _pageKey = 0;

  late final EverythingFilterInteractor _filterInteractor;
  final PagingController<int, Article> pagingController =
      PagingController(firstPageKey: _pageKey);
  EverythingFilter? _currentFilter;

  final loadNewsState = r.EntityStreamedState<News>();

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  void loadNews() async {
    if (_currentFilter == null) return;

    final resultWrapper = await model.perform(
      LoadingChange(
        filter: _currentFilter!,
        quoteInTitle: "Trump",
        pageSize: _pageSize,
        pageNum: _pageNum,
      ),
    );
    resultWrapper.collect(
      onSuccess: (result) {
        final items = (result as News).articles;
        final isLastPage = items.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(items);
        } else {
          _pageKey += items.length;
          pagingController.appendPage(items, _pageKey);
        }
        _pageNum++;
      },
      onError: (errorMessage) => pagingController.error(errorMessage),
    );
  }

  void refresh() {
    _pageKey = 0;
    _pageNum = 1;
    pagingController.refresh();
  }

  void _subscribeOnFilterUpdates() =>
      _filterInteractor.getEverythingFilterBroadcast().listen(
        (filter) {
          if (_currentFilter == null) {
            _currentFilter = filter;
            loadNews();
          } else {
            _currentFilter = filter;
            refresh();
          }
        },
      );
}
