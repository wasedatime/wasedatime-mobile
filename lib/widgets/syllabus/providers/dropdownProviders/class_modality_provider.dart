import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<String> modalities = [
  "In person",
  "In person / Online",
  "Full On-demand",
  "Scheduled On-demand",
  "Realtime Streaming",
];

class ClassModalityNotifier extends StateNotifier<Map<String, bool>> {
  ClassModalityNotifier()
      : super({
          'In person': false,
          'In person / Online': false,
          'Full On-demand': false,
          'Scheduled On-demand': false,
          'Realtime Streaming': false,
        });

  List<String> currentSelectedModalities = [];

  void updateSelectedModalities(List<String> updatedModalities) {
    safePrint("sadasda $currentSelectedModalities");
    final Map<String, bool> updatedState = {};

    // Initialize all semesters to false intially
    // and update everytime the widget is changed (select or deselect)
    for (final mod in modalities) {
      updatedState[mod] = false;
    }

    // Selected semesters are set to true
    for (final modality in updatedModalities) {
      updatedState[modality] = true;
      // safePrint(updatedState[modality]);
    }

    state = updatedState;

    currentSelectedModalities =
        state.keys.where((element) => state[element]!).toList();

    // safePrint(state);
  }

  List<String> getSelectedModalities() {
    // So that the dropdown field shows which semesters are selected
    // even if the user closes the dialog box
    // The bug was that the state was maintained but the UI didnt
    // reflect the state changes
    currentSelectedModalities =
        state.keys.where((element) => state[element]!).toList();
    // safePrint(currentSelectedModalities);
    return currentSelectedModalities;
  }
}

final classModalityNotifier =
    StateNotifierProvider<ClassModalityNotifier, Map<String, bool>>(
        (ref) => ClassModalityNotifier());
