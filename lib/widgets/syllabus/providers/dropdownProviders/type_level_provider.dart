import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const Map<String, String> kInitialTypeAndLevel = {
  'type': 'None',
  'level': 'None'
};

class TypeAndLevelNotifier extends StateNotifier<Map<String, String>> {
  TypeAndLevelNotifier() : super(kInitialTypeAndLevel);

  void updateSelectedTypeAndLevel({String? updatedType, String? updatedLevel}) {
    // Initialize all semesters to false intially
    // and update everytime the widget is changed (select or deselect)
    Map<String, String> updatedState = {};
    for (String i in state.keys) {
      updatedState[i] = state[i]!;
    }
    // Update state
    if (updatedType != null) {
      updatedState['type'] = updatedType;
    }

    if (updatedLevel != null) {
      safePrint(updatedLevel);
      updatedState['level'] = updatedLevel;
    }

    state = updatedState;

    safePrint(state);
  }
}

final typeAndLevelNotifier =
    StateNotifierProvider<TypeAndLevelNotifier, Map<String, String>>(
        (ref) => TypeAndLevelNotifier());
