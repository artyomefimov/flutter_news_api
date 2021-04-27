import 'dart:async';

import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_news_api/domain/interactor/filter/everything/everything_filter_interactor.dart';
import 'package:flutter_news_api/domain/model/filter/everything/everything_filter.dart';
import 'package:flutter_news_api/domain/model/filter/everything/language.dart';
import 'package:flutter_news_api/domain/model/filter/everything/sort_by.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EverythingFilterInteractorImpl implements EverythingFilterInteractor {
  static const _languageKey = 'language';
  static const _sortByKey = 'sort_by';
  final _filterStream = StreamController<EverythingFilter>.broadcast();
  final _languages = allLanguages();
  final _criteria = allCriteria();
  SharedPreferences? _sharedPreferences;
  EverythingFilter? _currentFilter;

  @override
  Future<void> resolveInitialFilter() async {
    final language = await _getInitialValue(
      key: _languageKey,
      defaultValue: Language.ENGLISH.name,
    );
    final sortBy = await _getInitialValue(
      key: _sortByKey,
      defaultValue: SortBy.RELEVANCY.value,
    );

    _currentFilter = EverythingFilter(
      language: _languages.find((e) => e.name == language) ?? Language.ENGLISH,
      sortBy: _criteria.find((e) => e.value == sortBy) ?? SortBy.RELEVANCY,
    );
    _filterStream.add(_currentFilter!);
  }

  @override
  Future<void> changeLanguage(String languageName) async {
    final prefs = await _getPreferences();
    await prefs.setString(_languageKey, languageName);
    _currentFilter = EverythingFilter(
      language:
          _languages.find((e) => e.name == languageName) ?? Language.ENGLISH,
      sortBy: _currentFilter!.sortBy,
    );
    _filterStream.add(_currentFilter!);
  }

  @override
  Future<void> changeSortBy(String value) async {
    final prefs = await _getPreferences();
    await prefs.setString(_sortByKey, value);
    _currentFilter = EverythingFilter(
      language: _currentFilter!.language,
      sortBy: _criteria.find((e) => e.value == value) ?? SortBy.RELEVANCY,
    );
    _filterStream.add(_currentFilter!);
  }

  @override
  Stream<EverythingFilter> getEverythingFilterBroadcast() =>
      _filterStream.stream.asBroadcastStream();

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
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }
}
