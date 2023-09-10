import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  // final List<String> selectedSemesters;
  // List<String> getSels
  void updateSelectedSemesters2(List<String> semesters) {
    for (String i in semesters) {
      safePrint(state[semesterMap[i]]);
      bool newValue = !state[semesterMap[i]]!;
      state = {...state, semesterMap[i]!: newValue};
      safePrint("$i");
      safePrint(semesterMap[i]);
      safePrint("semester $state");
    }
    safePrint(semesters);
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
