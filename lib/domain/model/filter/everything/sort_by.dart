class SortBy {
  final String _value;

  const SortBy._(this._value);

  static const RELEVANCY = const SortBy._("Relevancy");
  static const POPULARITY = const SortBy._("Popularity");
  static const PUBLISHED_AT = const SortBy._("PublishedAt");

  String get value => _value;
}

List<SortBy> allCriteria() => [
      SortBy.RELEVANCY,
      SortBy.POPULARITY,
      SortBy.PUBLISHED_AT,
    ];

List<String> allCriteriaValues() =>
    allCriteria().map((e) => e.value).toList(growable: false);
