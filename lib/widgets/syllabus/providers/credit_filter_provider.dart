import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditsFilterNotifier extends StateNotifier<Map<int, bool>> {
  CreditsFilterNotifier()
      : super({
          1: false,
          2: false,
          3: false,
        });

  void updateCreditFilters(int credit, bool newValue) {
    state = {...state, credit: !newValue};
    safePrint("credits: $state");
  }
}

final creditsFilterNotifier =
    StateNotifierProvider<CreditsFilterNotifier, Map<int, bool>>(
        (ref) => CreditsFilterNotifier());
