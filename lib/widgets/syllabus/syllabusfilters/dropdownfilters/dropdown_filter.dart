import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/class_modality_provider.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/language_provider.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/semester_provider.dart';

class DropdownFilterMulti extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  final List<String> selectedValues;
  const DropdownFilterMulti(
      {super.key,
      required this.label,
      required this.options,
      required this.selectedValues});

  @override
  ConsumerState<DropdownFilterMulti> createState() =>
      _DropdownFilterMultiState();
}

class _DropdownFilterMultiState extends ConsumerState<DropdownFilterMulti> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: DropDownMultiSelect(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            isCollapsed: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54))),
        onChanged: (List<String> x) {
          safePrint(x);
          if (widget.label == 'Select Languages') {
            ref
                .read(languageFilterNotifier.notifier)
                .updateSelectedLanguages(x);
          }
          if (widget.label == 'Select Semester') {
            ref
                .read(semesterFilterNotifier.notifier)
                .updateSelectedSemesters(x);
          }
          if (widget.label == 'Select Class Modality') {
            ref
                .read(classModalityNotifier.notifier)
                .updateSelectedModalities(x);
          }
        },
        // childBuilder: ,
        options: widget.options,
        selectedValues: widget.selectedValues,
        whenEmpty: widget.label,
      ),
    );
  }
}
