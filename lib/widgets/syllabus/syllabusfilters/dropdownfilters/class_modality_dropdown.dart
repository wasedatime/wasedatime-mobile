import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/class_modality_provider.dart';

class ClassModalityDropdown extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  final List<String> selectedValues;
  const ClassModalityDropdown(
      {super.key,
      required this.label,
      required this.options,
      required this.selectedValues});

  @override
  ConsumerState<ClassModalityDropdown> createState() =>
      _ClassModalityDropdownState();
}

class _ClassModalityDropdownState extends ConsumerState<ClassModalityDropdown> {
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
