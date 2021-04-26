import 'package:flutter/material.dart';
import 'package:flutter_news_api/presentation/view/everything/screen/all_filter_items.dart';
import 'package:flutter_news_api/presentation/view/everything/screen/all_news_screen.dart';
import 'package:flutter_news_api/presentation/view/everything/wm/all_news_widget_model.dart';
import 'package:flutter_news_api/presentation/view/everything/wm/everything_filter_widget_model.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

final _injector = Injector();

Widget allNewsScreen(BuildContext context) => AllNewsScreen(
      widgetModelBuilder: (context) => _injector.get<AllNewsWidgetModel>(),
    );

Widget allNewsFilterItems(BuildContext context) => AllNewsFilterItems(
  widgetModelBuilder: (context) => _injector.get<EverythingFilterWidgetModel>(),
);