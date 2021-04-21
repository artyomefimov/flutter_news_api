import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/interactor/news_interactor.dart';
import 'package:flutter_news_api/presentation/view/top/performer/loading_performer.dart';
import 'package:flutter_news_api/presentation/view/top/screen/top_highlights_screen.dart';
import 'package:flutter_news_api/presentation/view/top/wm/top_highlights_widget_model.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:mwwm/mwwm.dart';

final _injector = Injector();

Widget topHighlightsScreen(BuildContext context) => TopHighlightsScreen(
      widgetModelBuilder: (context) => TopHighlightsWidgetModel(
        WidgetModelDependencies(),
        Model([
          LoadingPerformer(
            interactor: _injector.get<NewsInteractor>(),
          ),
        ]),
      ),
    );
