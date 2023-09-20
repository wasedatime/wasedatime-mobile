import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Map<String, Map<String, bool>> kinitialSchoolFilters = {
  'undergraduate': {
    'sils': false,
    'pse': false,
    'ase': false,
    'fse': false,
    'cse': false,
    'edu': false,
    'law': false,
    'hss': false,
    'sss': false,
    'sps': false,
    'cms': false,
    'soc': false,
    'hum': false,
  },
  'graduate': {
    'g_sc': false,
    'g_sps': false,
    'g_fse': false,
    'g_e': false,
    'g_sa': false,
    'g_seee': false,
    'g_saps': false,
    'g_wbs': false,
    'g_ips': false,
    'g_ase': false,
    'g_hum': false,
    'g_cse': false,
    'g_siccs': false,
    'g_wls': false,
    'g_law': false,
    'g_las': false,
    'g_edu': false,
    'g_its': false,
    'g_ps': false,
    'g_sss': false,
    'g_sjal': false,
  },
  'special': {'cjl': false, 'gec': false, 'cie': false, 'art': false}
};

class SchoolsFilterNotifier
    extends StateNotifier<Map<String, Map<String, bool>>> {
  SchoolsFilterNotifier() : super(kinitialSchoolFilters);

  void updateSelectedSchoolFilter(
      String selectedSchool, String selectedFaculty) {
    final Map<String, Map<String, bool>> updatedState = {};

    // Initialize all semesters to false intially
    // and update everytime the widget is changed (select or deselect)
    for (final school in kinitialSchoolFilters.keys) {
      updatedState[school] = kinitialSchoolFilters[school]!;
    }
    safePrint(updatedState);

    // Updates state of selected faculty
    if (state[selectedSchool]![selectedFaculty] == true) {
      updatedState[selectedSchool]![selectedFaculty] = false;
    } else {
      updatedState[selectedSchool]![selectedFaculty] = true;
    }

    state = updatedState;

    // safePrint(state);
  }
}

final schoolsFilterNotifier = StateNotifierProvider<SchoolsFilterNotifier,
    Map<String, Map<String, bool>>>((ref) => SchoolsFilterNotifier());
