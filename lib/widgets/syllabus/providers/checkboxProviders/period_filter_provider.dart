import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeriodsFilterNotifier extends StateNotifier<Map<int, bool>> {
  PeriodsFilterNotifier()
      : super({
          1: false,
          2: false,
          3: false,
          4: false,
          5: false,
          6: false,
          7: false,
        });

  void updatePeriod(int period, bool newValue) {
    state = {...state, period: !newValue};
    safePrint(state);
  }
}

final periodsFilterNotifier =
    StateNotifierProvider<PeriodsFilterNotifier, Map<int, bool>>(
        (ref) => PeriodsFilterNotifier());
