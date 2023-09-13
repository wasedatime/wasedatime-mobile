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

  final List<String> selectedSemesters = [];

  void updateSelectedSemesters(List<String> semesters) {
    // BUG: only updates when selecting and not when deselecting
    safePrint(semesters);
    for (String j in allSemesters) {
      if (state[semesterMap[j]] == true && !semesters.contains(j)) {
        // means that it was previously checked and is now unchecked
        // update the state
        safePrint("$j ${semesterMap[j]} ${state[semesterMap[j]]}");
        bool newValue = !state[semesterMap[j]]!;
        state = {...state, semesterMap[j]!: newValue};
      }
    }
    for (String i in semesters) {
      bool newValue = !state[semesterMap[i]]!;
      safePrint("$i ${semesterMap[i]} $newValue");
      state = {...state, semesterMap[i]!: newValue};
    }

    safePrint(state);
  }

  // void updateSelectedSemesters2(ListM) {
  //   for
  // }

  // to be added if there are any bugs in the UI

  // List<String> getSelectedSemesters() {
  //   state.forEach((key, value) {});
  // }

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
