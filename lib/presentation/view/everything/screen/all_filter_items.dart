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
  final _searchController = TextEditingController();
  late final onLanguageClicked;
  late final onSortByClicked;
  var _searchInProgress = false;

  @override
  void initState() {
    super.initState();
    onLanguageClicked = (language) => wm.setLanguage(language);
    onSortByClicked = (value) => wm.setSortBy(value);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              return Column(children: [
                _filterItemsRow(data),
                Visibility(
                  visible: _searchInProgress,
                  child: _searchField(),
                )
              ]);
            }
          },
        ),
      );

  Widget _filterItemsRow(EverythingFilter filter) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilterItem(
            text: _createFilterItemText(
              Strings.languagePrefix,
              filter.language.name,
            ),
            dialogTitle: Strings.chooseLanguage,
            dialogContent: allLanguageNames(),
            onClicked: onLanguageClicked,
          ),
          FilterItem(
            text: _createFilterItemText(
              Strings.sortByPrefix,
              filter.sortBy.value,
            ),
            dialogTitle: Strings.chooseSortBy,
            dialogContent: allCriteriaValues(),
            onClicked: onSortByClicked,
          ),
          IconButton(
            icon: Icon(_searchInProgress ? Icons.search_off : Icons.search),
            onPressed: _onSearchPressed,
          )
        ],
      );

  String _createFilterItemText(String prefix, String suffix) =>
      '$prefix: $suffix';

  void _onSearchPressed() {
    setState(() {
      _searchInProgress = !_searchInProgress;
    });
  }

  Widget _searchField() => Container(
        padding: EdgeInsets.all(Dimensions.marginNormal),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: Strings.searchLabel,
            hintText: Strings.searchHint,
            prefixIcon: Icon(Icons.search),
            suffixIcon: GestureDetector(
              onTap: () {
                _searchController.clear();
              },
              child: Icon(
                Icons.clear,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.itemRadius),
              ),
              borderSide: BorderSide(
                color: Colors.grey,
                width: Dimensions.searchFieldStrokeWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.itemRadius),
              ),
              borderSide: BorderSide(
                color: Colors.indigoAccent,
                width: Dimensions.searchFieldStrokeWidth,
              ),
            ),
          ),
          keyboardType: TextInputType.text,
          onSubmitted: (query) {
            wm.setSearchQuery(query);
            _onSearchPressed();
          },
        ),
      );
}
