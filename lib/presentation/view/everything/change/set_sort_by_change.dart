import 'package:mwwm/mwwm.dart';

class SetSortByChange extends FutureChange<void> {
  late final String value;

  SetSortByChange({required this.value});
}
