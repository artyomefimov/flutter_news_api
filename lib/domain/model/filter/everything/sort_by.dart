class SortBy {
  final String _value;

  const SortBy._(this._value);

  static const RELEVANCY = SortBy._('Relevancy');
  static const POPULARITY = SortBy._('Popularity');
  static const PUBLISHED_AT = SortBy._('PublishedAt');

  String get value => _value;
}

List<SortBy> allCriteria() => [
      SortBy.RELEVANCY,
      SortBy.POPULARITY,
      SortBy.PUBLISHED_AT,
    ];

List<String> allCriteriaValues() =>
    allCriteria().map((e) => e.value).toList(growable: false);
