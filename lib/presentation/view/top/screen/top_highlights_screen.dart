import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/filter/top/category.dart';
import 'package:flutter_news_api/domain/model/filter/top/country.dart';
import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/domain/model/news/news.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/item/article_item.dart';
import 'package:flutter_news_api/presentation/view/top/screen/top_filter_items.dart';
import 'package:flutter_news_api/presentation/view/top/wm/top_highlights_widget_model.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart' as r;
import 'package:scroll_shadow_container/scroll_shadow_container.dart';

class TopHighlightsScreen extends CoreMwwmWidget {
  TopHighlightsScreen({
    required WidgetModelBuilder widgetModelBuilder,
  }) : super(widgetModelBuilder: widgetModelBuilder);

  @override
  _TopHighlightsScreenState createState() => _TopHighlightsScreenState();
}

class _TopHighlightsScreenState extends WidgetState<TopHighlightsWidgetModel> {
  late final TopFilterChangedCallback onFilterChanged;

  @override
  void initState() {
    super.initState();
    onFilterChanged = (filter) => _onFilterChanged(filter);
    wm.loadNews(Country.USA.code, Category.SPORTS.value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopFilterItems(onFilterChanged: onFilterChanged),
        Expanded(
          child: ScrollShadowContainer(
            elevation: MaterialElevation.the4dp,
            child: r.EntityStateBuilder<News>(
              streamedState: wm.loadNewsState,
              child: (context, data) => _contentChild(data as News),
              loadingChild: _loadingChild(),
              errorChild: _errorChild(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _loadingChild() => Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
          strokeWidth: Dimensions.progressBarStrokeWidth,
        ),
      );

  Widget _contentChild(News news) => ListView.builder(
        itemCount: news.articles.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white30,
            padding: EdgeInsets.only(
              top:
                  index == 0 ? Dimensions.marginNormal : Dimensions.marginEight,
              left: Dimensions.marginNormal,
              right: Dimensions.marginNormal,
              bottom: index == news.articles.length - 1
                  ? Dimensions.marginNormal
                  : Dimensions.marginEight,
            ),
            child: ArticleItem(news.articles[index]),
          );
        },
      );

  Widget _errorChild() => Text(Strings.topHighlights);

  void _onFilterChanged(TopFilter filter) {
    wm.loadNews(filter.country.code, filter.category.value);
  }
}
