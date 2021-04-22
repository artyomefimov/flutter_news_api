import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/presentation/view/top/change/loading_change.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart' as r;

class TopHighlightsWidgetModel extends WidgetModel {
  TopHighlightsWidgetModel(
    WidgetModelDependencies baseDependencies,
    Model model,
  ) : super(baseDependencies, model: model);

  final loadNewsState = r.EntityStreamedState<News>();

  void loadNews(String? country, String? category) async {
    await loadNewsState.loading();
    final resultWrapper = await model.perform(LoadingChange(
      country: country,
      category: category,
    ));
    resultWrapper.collect(
      onSuccess: (result) => loadNewsState.content(result as News),
      onError: (errorMessage) => loadNewsState.error(errorMessage),
    );
  }
}
