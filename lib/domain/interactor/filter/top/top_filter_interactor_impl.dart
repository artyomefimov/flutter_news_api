import 'dart:async';

import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_news_api/domain/interactor/filter/top/top_filter_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/top/category.dart';
import 'package:flutter_news_api/domain/model/filter/top/country.dart';
import 'package:flutter_news_api/domain/model/filter/top/top_filter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopFilterInteractorImpl implements TopFilterInteractor {
  static const _countryNameKey = "country_name";
  static const _categoryValueKey = "category_value";
  SharedPreferences? _sharedPreferences;
  final _topFilterStream = StreamController<TopFilter>.broadcast();
  final _countries = allCountries();
  final _categories = allCategories();
  TopFilter? _currentFilter;

  @override
  Future<void> resolveInitialFilter() async {
    final countryName = await _getInitialValue(
      key: _countryNameKey,
      defaultValue: Country.USA.name,
    );
    final categoryValue = await _getInitialValue(
      key: _categoryValueKey,
      defaultValue: Category.GENERAL.value,
    );

    _currentFilter = TopFilter(
      country: _countries.find((e) => e.name == countryName) ?? Country.USA,
      category:
          _categories.find((e) => e.value == categoryValue) ?? Category.GENERAL,
    );
    _topFilterStream.add(_currentFilter!);
  }

  @override
  Future<void> changeCountryName(String countryName) async {
    final prefs = await _getPreferences();
    prefs.setString(_countryNameKey, countryName);
    _currentFilter = TopFilter(
      country: _countries.find((e) => e.name == countryName) ?? Country.USA,
      category: _currentFilter!.category,
    );
    _topFilterStream.add(_currentFilter!);
  }

  @override
  Future<void> changeCategoryValue(String categoryValue) async {
    final prefs = await _getPreferences();
    prefs.setString(_categoryValueKey, categoryValue);
    _currentFilter = TopFilter(
      country: _currentFilter!.country,
      category:
          _categories.find((e) => e.value == categoryValue) ?? Category.GENERAL,
    );
    _topFilterStream.add(_currentFilter!);
  }

  @override
  Stream<TopFilter> getTopFilterBroadcast() =>
      _topFilterStream.stream.asBroadcastStream();

  Future<String> _getInitialValue({
    required String key,
    required String defaultValue,
  }) async {
    final prefs = await _getPreferences();
    if (!prefs.containsKey(key)) {
      await prefs.setString(key, defaultValue);
    }
    return prefs.getString(key) ?? defaultValue;
  }

  Future<SharedPreferences> _getPreferences() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _sharedPreferences!;
  }
}
