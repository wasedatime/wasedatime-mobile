import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> allLanguages = [
  "English",
  "Japanese",
  "German",
  "Chinese",
  "Russian",
  "Korean",
];

class LanguageFilterNotifier extends StateNotifier<Map<String, bool>> {
  LanguageFilterNotifier()
      : super({
          '0s': false,
          '2s': false,
          '0q': false,
          '1q': false,
          '2q': false,
          '3q': false,
        });

  List<String> currentSelectedLanguages = [];

  void updateSelectedLanguages(List<String> languages) {
    // BUG: only updates when selecting and not when deselecting
    final Map<String, bool> updatedState = {};

    // Initialize all languages to false intially
    // and update everytime the widget is changed (select or deselect)
    for (final lang in allLanguages) {
      updatedState[lang] = false;
    }

    // Selected languages are set to true
    for (final language in languages) {
      updatedState[language] = true;
      safePrint(updatedState[language]);
    }

    state = updatedState;

    safePrint(state);
  }

  // List<String> getSelectedLanguages() {
  //   // So that the dropdown field shows which semesters are selected
  //   // even if the user closes the dialog box
  //   // The bug was that the state was maintained but the UI didnt
  //   // reflect the state changes
  //   currentSelectedLanguages =
  //       state.keys.where((element) => state[element]!).toList();
  //   safePrint(currentSelectedLanguages);
  //   return currentSelectedLanguages;
  // }
}

final languageFilterNotifier =
    StateNotifierProvider<LanguageFilterNotifier, Map<String, bool>>(
        (ref) => LanguageFilterNotifier());
