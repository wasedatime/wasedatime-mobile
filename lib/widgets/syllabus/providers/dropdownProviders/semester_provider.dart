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

  List<String> currentSelectedSemesters = [];

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

    // print('here $currentSelectedSemesters');

    safePrint(state);
    // List<String> a = allSemesters.where((element) {
    //   safePrint('a: $element');
    //   safePrint('a: ${semesterMap[element]}');
    //   if (state[semesterMap[element]] == true) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // }).toList();
    // safePrint('a: $a');
  }

  // List<String> get getSelectedSemesters => semesterMap2.values.where((element) {
  //       if (state[semesterMap2] == true) {
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     }).toList();

  // List<String> getSelectedSemesters() {
  //   // So that the dropdown field shows which semesters are selected
  //   // even if the user closes the dialog box
  //   // The bug was that the state was maintained but the UI didnt
  //   // reflect the state changes

  //   safePrint('here $currentSelectedSemesters');
  //   return currentSelectedSemesters;
  // }

  final Map<String, String> semesterMap = {
    'Spring Semester': '0s',
    'Fall Semester': '2s',
    'Spring Quarter': '0q',
    'Summer Quarter': '1q',
    'Fall Quarter': '2q',
    'Winter Quarter': '3q',
  };

  final Map<String, String> semesterMap2 = {
    '0s': 'Spring Semester',
    '2s': 'Fall Semester',
    '0q': 'Spring Quarter',
    '1q': 'Summer Quarter',
    '2q': 'Fall Quarter',
    '3q': 'Winter Quarter',
  };
}

final semesterFilterNotifier =
    StateNotifierProvider<SemesterFilterNotifier, Map<String, bool>>(
        (ref) => SemesterFilterNotifier());
