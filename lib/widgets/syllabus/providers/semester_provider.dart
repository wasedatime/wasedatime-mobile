import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> allSemesters = [
  "Fall Semester",
  "Spring Semester",
  "Spring Quarter",
  "Summer Quarter",
  "Fall Quarter",
  "Winter Quarter",
];

class SemesterFilterNotifier extends StateNotifier<Map<String, bool>> {
  SemesterFilterNotifier()
      : super({
          '0s': false,
          '2s': false,
          '0q': false,
          '1q': false,
          '2q': false,
          '3q': false,
        });

  void updateSelectedSemesters(List<String> semesters) {
    // BUG: only updates when selecting and not when deselecting
    safePrint(semesters);
    safePrint(state);
    final Map<String, bool> updatedState = {};

    // Initialize all semesters to false intially
    // and update everytime the widget is changed (select or deselect)
    for (final sem in allSemesters) {
      updatedState[semesterMap[sem]!] = false;
    }

    // Selected semesters are set to true
    for (final semester in semesters) {
      updatedState[semesterMap[semester]!] = true;
      safePrint(updatedState[semesterMap[semester]!]);
    }

    state = updatedState;

    safePrint(state);
  }

  final Map<String, String> semesterMap = {
    'Spring Semester': '0s',
    'Fall Semester': '2s',
    'Spring Quarter': '0q',
    'Summer Quarter': '1q',
    'Fall Quarter': '2q',
    'Winter Quarter': '3q',
  };
}

final semesterFilterNotifier =
    StateNotifierProvider<SemesterFilterNotifier, Map<String, bool>>(
        (ref) => SemesterFilterNotifier());
