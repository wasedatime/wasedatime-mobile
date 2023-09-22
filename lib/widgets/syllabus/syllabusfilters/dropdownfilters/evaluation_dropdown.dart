import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/evaluation_provider.dart';

class EvaluationDropdown extends ConsumerStatefulWidget {
  final List<String> listOptions;
  const EvaluationDropdown({super.key, required this.listOptions});

  @override
  ConsumerState<EvaluationDropdown> createState() => _EvaluationDropdownState();
}

class _EvaluationDropdownState extends ConsumerState<EvaluationDropdown> {
  String _currentEvaluationValue = 'Select Evaluation';

  String getCurrentEvaluationValue() {
    _currentEvaluationValue =
        ref.read(evaluationNotifier.notifier).getCurrentEvaluationValue;
    return _currentEvaluationValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            isCollapsed: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54))),
        isExpanded: true,
        disabledHint: const Text("Select Evaluation"),
        value: getCurrentEvaluationValue(),
        onChanged: (newValue) {
          ref
              .read(evaluationNotifier.notifier)
              .updateEvaluations(updatedEvaluation: newValue);

          setState(() {
            _currentEvaluationValue = newValue!;
          });
        },
        items: widget.listOptions.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
