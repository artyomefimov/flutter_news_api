import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/view/top/screen/top_filter_items.dart';
import 'package:flutter_news_api/presentation/view/top/screen/top_highlights_screen.dart';
import 'package:flutter_news_api/presentation/view/top/wm/top_filter_widget_model.dart';
import 'package:flutter_news_api/presentation/view/top/wm/top_highlights_widget_model.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

final _injector = Injector();

Widget topHighlightsScreen(BuildContext context) => TopHighlightsScreen(
      widgetModelBuilder: (context) =>
          _injector.get<TopHighlightsWidgetModel>(),
    );

Widget topFilterItems(BuildContext context) => TopFilterItems(
      widgetModelBuilder: (context) => _injector.get<TopFilterWidgetModel>(),
    );
