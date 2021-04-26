import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/news/article.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/error/error_widget.dart';
import 'package:flutter_news_api/presentation/view/everything/route/all_news_route.dart';
import 'package:flutter_news_api/presentation/view/everything/wm/all_news_widget_model.dart';
import 'package:flutter_news_api/presentation/view/item/article_item.dart';
import 'package:flutter_news_api/presentation/view/loading/loading.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mwwm/mwwm.dart';

class AllNewsScreen extends CoreMwwmWidget {
  AllNewsScreen({
    required WidgetModelBuilder widgetModelBuilder,
  }) : super(widgetModelBuilder: widgetModelBuilder);

  @override
  _AllNewsScreenState createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends WidgetState<AllNewsWidgetModel> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          allNewsFilterItems(context),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => Future.sync(() => wm.refresh()),
              child: PagedListView(
                pagingController: wm.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Article>(
                    itemBuilder: (context, item, index) => Container(
                          color: Colors.white30,
                          padding: EdgeInsets.only(
                            top: index == 0
                                ? Dimensions.marginNormal
                                : Dimensions.marginEight,
                            left: Dimensions.marginNormal,
                            right: Dimensions.marginNormal,
                            bottom: Dimensions.marginEight,
                          ),
                          child: ArticleItem(item),
                        ),
                    firstPageProgressIndicatorBuilder: (_) =>
                        loadingIndicator(),
                    firstPageErrorIndicatorBuilder: (_) => ErrorItem(
                          onRetryClicked: () => wm.loadNews(),
                        )),
              ),
            ),
          ),
        ],
      );
}
