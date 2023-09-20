import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/evaluation_provider.dart';
import 'package:wasedatime/widgets/syllabus/syllabusfilters/dropdownfilters/type_level_dropdown.dart';

const List<String> evaluations = [
  'Select Evaluation',
  'Exams',
  'Papers',
  'Class Participation',
  'Others'
];

class EvaluationFilter extends ConsumerStatefulWidget {
  const EvaluationFilter({super.key});

  @override
  ConsumerState<EvaluationFilter> createState() => _EvaluationFilterState();
}

class _EvaluationFilterState extends ConsumerState<EvaluationFilter> {
  RangeValues _currentRangeValues = RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TypeAndLevelDropdown(
          label: 'evaluation',
          listOptions: evaluations,
        ),
        RangeSlider(
          activeColor: Color.fromARGB(255, 155, 17, 17),
          values: _currentRangeValues,
          min: 0,
          max: 100,
          divisions: 10,
          labels: RangeLabels(
            "${_currentRangeValues.start.round().toString()}%",
            "${_currentRangeValues.end.round().toString()}%",
          ),
          onChanged: (RangeValues values) {
            safePrint(values.start);
            _currentRangeValues = values; // Update the local variable
            ref.read(evaluationNotifier.notifier).updateEvaluations(
                updatedStart: values.start, updatedEnd: values.end);
            setState(() {}); // Call setState to trigger a rebuild
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Start: ${_currentRangeValues.start.round()}%",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "End: ${_currentRangeValues.end.round()}%",
              style: TextStyle(fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}
