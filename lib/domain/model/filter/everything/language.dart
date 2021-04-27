class Language {
  final String _code;
  final String _name;

  const Language._(this._code, this._name);

  static const GERMAN = Language._('de', 'German');
  static const FRENCH = Language._('fr', 'French');
  static const ENGLISH = Language._('en', 'English');
  static const ITALIAN = Language._('it', 'Italian');
  static const RUSSIAN = Language._('ru', 'Russian');
  static const SPANISH = Language._('es', 'Spanish');

  String get code => _code;

  String get name => _name;
}

List<Language> allLanguages() => [
      Language.GERMAN,
      Language.FRENCH,
      Language.ENGLISH,
      Language.ITALIAN,
      Language.RUSSIAN,
      Language.SPANISH,
    ];

List<String> allLanguageNames() =>
    allLanguages().map((e) => e.name).toList(growable: false);
