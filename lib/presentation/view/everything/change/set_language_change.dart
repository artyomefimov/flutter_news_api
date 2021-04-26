import 'package:mwwm/mwwm.dart';

class SetLanguageChange extends FutureChange<void> {
  late final String language;

  SetLanguageChange({required this.language});
}
