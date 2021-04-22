import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/filter/top/category.dart';
import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:flutter_news_api/domain/model/filter/top/country.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/view/filter/filter_item.dart';
import 'package:dart_extensions/dart_extensions.dart';

typedef TopFilterChangedCallback = void Function(TopFilter);

class TopFilterItems extends StatefulWidget {
  final TopFilterChangedCallback onFilterChanged;

  TopFilterItems({Key? key, required this.onFilterChanged}) : super(key: key);

  @override
  _TopFilterItemsState createState() => _TopFilterItemsState();
}

class _TopFilterItemsState extends State<TopFilterItems> {
  final countries = allCountries();
  final categories = allCategories();
  TopFilter currentFilter = TopFilter.byDefault();
  late final onCountryClicked;
  late final onCategoryClicked;

  @override
  void initState() {
    super.initState();
    onCountryClicked = (s) => _changeCountry(s);
    onCategoryClicked = (s) => _changeCategory(s);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Dimensions.marginEight,
        bottom: Dimensions.marginEight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilterItem(
            text: currentFilter.country.name,
            dialogTitle: Strings.chooseCountry,
            dialogContent: allCountryNames(),
            onClicked: onCountryClicked,
          ),
          FilterItem(
            text: currentFilter.category.value,
            dialogTitle: Strings.chooseCategory,
            dialogContent: allCategoryValues(),
            onClicked: onCategoryClicked,
          ),
        ],
      ),
    );
  }

  void _changeCountry(String countryName) {
    final newCountry =
        countries.find((e) => e.name == countryName) ?? Country.USA;
    setState(() {
      currentFilter =
          TopFilter(country: newCountry, category: currentFilter.category);
      widget.onFilterChanged(currentFilter);
    });
  }

  void _changeCategory(String category) {
    final newCategory =
        categories.find((e) => e.value == category) ?? Category.SPORTS;
    setState(() {
      currentFilter =
          TopFilter(country: currentFilter.country, category: newCategory);
      widget.onFilterChanged(currentFilter);
    });
  }
}
