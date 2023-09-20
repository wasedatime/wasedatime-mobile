import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EligibleYearsFilterNotifier extends StateNotifier<Map<int, bool>> {
  EligibleYearsFilterNotifier()
      : super({
          1: false,
          2: false,
          3: false,
          4: false,
        });

  void updateEligibleYear(int eligYear, bool newValue) {
    state = {...state, eligYear: !newValue};
    safePrint(state);
  }
}

final eligibleYearsFilterNotifier =
    StateNotifierProvider<EligibleYearsFilterNotifier, Map<int, bool>>(
        (ref) => EligibleYearsFilterNotifier());
