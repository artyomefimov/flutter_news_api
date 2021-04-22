import 'package:mwwm/mwwm.dart';

class SetCountryChange extends FutureChange<void> {
  late final String countryName;

  SetCountryChange({required this.countryName});
}
