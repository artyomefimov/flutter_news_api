class Category {
  final String _value;

  const Category._(this._value);

  static const BUSINESS = Category._('Business');
  static const ENTERTAINMENT = Category._('Entertainment');
  static const GENERAL = Category._('General');
  static const HEALTH = Category._('Health');
  static const SCIENCE = Category._('Science');
  static const SPORTS = Category._('Sports');
  static const TECHNOLOGY = Category._('Technology');

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
