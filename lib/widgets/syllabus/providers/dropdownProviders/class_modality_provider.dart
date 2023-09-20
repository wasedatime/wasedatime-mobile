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

  void updateSelectedModalities(List<String> updatedModalities) {
    final Map<String, bool> updatedState = {};

    // Initialize all semesters to false intially
    // and update everytime the widget is changed (select or deselect)
    for (final mod in modalities) {
      updatedState[mod] = false;
    }

    // Selected semesters are set to true
    for (final modality in updatedModalities) {
      updatedState[modality] = true;
      safePrint(updatedState[modality]);
    }

    state = updatedState;

    safePrint(state);
  }

  final Map<String, String> classModalityMap = {};
}

final classModalityNotifier =
    StateNotifierProvider<ClassModalityNotifier, Map<String, bool>>(
        (ref) => ClassModalityNotifier());
