import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const Map<String, dynamic> kInitialEvaluations = {
  'evaluation': 'Select Evaluation',
  'start': 0.0,
  'end': 100.0
};

class EvaluationNotifier extends StateNotifier<Map<String, dynamic>> {
  EvaluationNotifier() : super(kInitialEvaluations);

  void updateEvaluations(
      {String? updatedEvaluation, double? updatedStart, double? updatedEnd}) {
    // Initialize all semesters to false intially
    // and update everytime the widget is changed (select or deselect)
    Map<String, dynamic> updatedState = {};
    for (String i in state.keys) {
      updatedState[i] = state[i]!;
    }
    // Update state
    if (updatedEvaluation != null) {
      updatedState['evaluation'] = updatedEvaluation;
    }

    if (updatedStart != null) {
      safePrint(updatedStart);
      updatedState['start'] = updatedStart;
    }

    if (updatedEnd != null) {
      safePrint(updatedEnd);
      updatedState['end'] = updatedEnd;
    }

    state = updatedState;

    safePrint(state);
  }

  RangeValues get getCurrentRangeValues =>
      RangeValues(state['start'], state['end']);

  String get getCurrentEvaluationValue => state['evaluation'];
}

final evaluationNotifier =
    StateNotifierProvider<EvaluationNotifier, Map<String, dynamic>>(
        (ref) => EvaluationNotifier());
