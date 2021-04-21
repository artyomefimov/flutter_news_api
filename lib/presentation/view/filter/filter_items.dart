import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/domain/model/category.dart';
import 'package:flutter_news_api/domain/model/country.dart';
import 'package:flutter_news_api/presentation/constants.dart';
import 'package:flutter_news_api/presentation/model/current_filter.dart';
import 'package:flutter_news_api/presentation/view/filter/filter_item.dart';

typedef FilterClickedCallback = void Function(String);
typedef FilterChangedCallback = void Function(CurrentFilter);

class FilterItems extends StatefulWidget {
  final FilterChangedCallback onFilterChanged;

  FilterItems({Key? key, required this.onFilterChanged}) : super(key: key);

  @override
  _FilterItemsState createState() => _FilterItemsState();
}

class _FilterItemsState extends State<FilterItems> {
  final countries = allCountries();
  final categories = allCategories();
  CurrentFilter currentFilter = CurrentFilter.byDefault();
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
          CountryFilterItem(
            text: currentFilter.country.name,
            onClicked: onCountryClicked,
          ),
          CategoryFilterItem(
            text: currentFilter.category.value,
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
          CurrentFilter(country: newCountry, category: currentFilter.category);
      widget.onFilterChanged(currentFilter);
    });
  }

  void _changeCategory(String category) {
    final newCategory =
        categories.find((e) => e.value == category) ?? Category.SPORTS;
    setState(() {
      currentFilter =
          CurrentFilter(country: currentFilter.country, category: newCategory);
      widget.onFilterChanged(currentFilter);
    });
  }
}
