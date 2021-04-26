import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/filter/top/category.dart';
import 'package:flutter_news_api/domain/model/filter/top/country.dart';
import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/filter/filter_item.dart';
import 'package:flutter_news_api/presentation/view/top/wm/top_filter_widget_model.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

class TopFilterItems extends CoreMwwmWidget {
  TopFilterItems({
    required WidgetModelBuilder widgetModelBuilder,
  }) : super(widgetModelBuilder: widgetModelBuilder);

  @override
  _TopFilterItemsState createState() => _TopFilterItemsState();
}

class _TopFilterItemsState extends WidgetState<TopFilterWidgetModel> {
  late final onCountryClicked;
  late final onCategoryClicked;

  @override
  void initState() {
    super.initState();
    wm.getInitialFilter();
    onCountryClicked = (countryName) => wm.setCountryName(countryName);
    onCategoryClicked = (categoryValue) => wm.setCategoryValue(categoryValue);
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          top: Dimensions.marginEight,
          bottom: Dimensions.marginEight,
        ),
        child: StreamedStateBuilder<TopFilter>(
          streamedState: wm.topFilterState,
          builder: (context, data) {
            if (data == null) {
              return Container();
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterItem(
                    text: data.country.name,
                    dialogTitle: Strings.chooseCountry,
                    dialogContent: allCountryNames(),
                    onClicked: onCountryClicked,
                  ),
                  FilterItem(
                    text: data.category.value,
                    dialogTitle: Strings.chooseCategory,
                    dialogContent: allCategoryValues(),
                    onClicked: onCategoryClicked,
                  ),
                ],
              );
            }
          },
        ),
      );
}
