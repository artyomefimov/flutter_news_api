import 'package:mwwm/mwwm.dart';

class SetSearchQueryChange extends FutureChange<void> {
  late final String query;

  SetSearchQueryChange({required this.query});
}