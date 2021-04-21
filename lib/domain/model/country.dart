class Country {
  final String _code;
  final String _name;

  const Country._(this._code, this._name);

  static const GERMANY = const Country._("de", "Germany");
  static const FRANCE = const Country._("fr", "France");
  static const GREAT_BRITAIN = const Country._("gb", "Great Britain");
  static const ITALY = const Country._("it", "Italy");
  static const RUSSIA = const Country._("ru", "Russia");
  static const USA = const Country._("us", "USA");

  String get code => _code;

  String get name => _name;
}

List<Country> allCountries() => [
      Country.GERMANY,
      Country.FRANCE,
      Country.GREAT_BRITAIN,
      Country.ITALY,
      Country.RUSSIA,
      Country.USA,
    ];

List<String> allCountryNames() =>
    allCountries().map((e) => e.name).toList(growable: false);
