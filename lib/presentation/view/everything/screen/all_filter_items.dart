import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/filter/everything/everything_filter.dart';
import 'package:flutter_news_api/domain/model/filter/everything/language.dart';
import 'package:flutter_news_api/domain/model/filter/everything/sort_by.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/everything/wm/everything_filter_widget_model.dart';
import 'package:flutter_news_api/presentation/view/filter/filter_item.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

class AllNewsFilterItems extends CoreMwwmWidget {
  AllNewsFilterItems({
    required WidgetModelBuilder widgetModelBuilder,
  }) : super(widgetModelBuilder: widgetModelBuilder);

  @override
  _AllNewsFilterItemsState createState() => _AllNewsFilterItemsState();
}

class _AllNewsFilterItemsState
    extends WidgetState<EverythingFilterWidgetModel> {
  late final onLanguageClicked;
  late final onSortByClicked;

  @override
  void initState() {
    super.initState();
    wm.getInitialFilter();
    onLanguageClicked = (language) => wm.setLanguage(language);
    onSortByClicked = (value) => wm.setSortBy(value);
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          top: Dimensions.marginEight,
          bottom: Dimensions.marginEight,
        ),
        child: StreamedStateBuilder<EverythingFilter>(
          streamedState: wm.filterState,
          builder: (context, data) {
            if (data == null) {
              return Container();
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterItem(
                    text: data.language.name,
                    dialogTitle: Strings.chooseLanguage,
                    dialogContent: allLanguageNames(),
                    onClicked: onLanguageClicked,
                  ),
                  FilterItem(
                    text: data.sortBy.value,
                    dialogTitle: Strings.chooseSortBy,
                    dialogContent: allCriteriaValues(),
                    onClicked: onSortByClicked,
                  ),
                ],
              );
            }
          },
        ),
      );
}
