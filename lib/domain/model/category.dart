class Category {
  final String _value;

  const Category._(this._value);

  static const BUSINESS = const Category._("Business");
  static const ENTERTAINMENT = const Category._("Entertainment");
  static const GENERAL = const Category._("General");
  static const HEALTH = const Category._("Health");
  static const SCIENCE = const Category._("Science");
  static const SPORTS = const Category._("Sports");
  static const TECHNOLOGY = const Category._("Technology");

  String get value => _value;
}

List<Category> allCategories() => [
      Category.BUSINESS,
      Category.ENTERTAINMENT,
      Category.GENERAL,
      Category.HEALTH,
      Category.SCIENCE,
      Category.SPORTS,
      Category.TECHNOLOGY,
    ];

List<String> allCategoryValues() =>
    allCategories().map((e) => e.value).toList(growable: false);
