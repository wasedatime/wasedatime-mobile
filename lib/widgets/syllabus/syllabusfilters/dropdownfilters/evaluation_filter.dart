import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/class_modality_provider.dart';

class EvaluationFilter extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  final List<String> selectedValues;
  const EvaluationFilter(
      {super.key,
      required this.label,
      required this.options,
      required this.selectedValues});

  @override
  ConsumerState<EvaluationFilter> createState() => _EvaluationFilterState();
}

class _EvaluationFilterState extends ConsumerState<EvaluationFilter> {
  final List<String> evaluations = [
    'Exams',
    'Papers',
    'Class Participation',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect(
      onChanged: (List<String> x) {
        safePrint(x);
        ref.read(classModalityNotifier.notifier).updateSelectedModalities(x);
      },
      // childBuilder: ,
      options: widget.options,
      selectedValues: widget.selectedValues,
      whenEmpty: widget.label,
    );
  }
}
