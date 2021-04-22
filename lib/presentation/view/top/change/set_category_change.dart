import 'package:mwwm/mwwm.dart';

class SetCategoryChange extends FutureChange<void> {
  late final String categoryValue;

  SetCategoryChange({required this.categoryValue});
}
