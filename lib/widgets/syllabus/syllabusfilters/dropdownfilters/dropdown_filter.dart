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
  List<String> currentSelectedValues = [];

  @override
  Widget build(BuildContext context) {
    List<String> getValues() {
      if (widget.label == 'Select Class Modality') {
        currentSelectedValues =
            ref.read(classModalityNotifier.notifier).currentSelectedModalities;
        safePrint(currentSelectedValues);
      }
      if (widget.label == 'Select Languages') {
        currentSelectedValues =
            ref.read(languageFilterNotifier.notifier).currentSelectedLanguages;
        safePrint(currentSelectedValues);
      }

      return currentSelectedValues;
    }

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
          currentSelectedValues = x;
          safePrint(x);
          if (widget.label == 'Select Languages') {
            ref
                .read(languageFilterNotifier.notifier)
                .updateSelectedLanguages(x);
          }
          if (widget.label == 'Select Semesters') {
            ref
                .read(semesterFilterNotifier.notifier)
                .updateSelectedSemesters(x);
            getValues();
          }
          if (widget.label == 'Select Class Modality') {
            ref
                .read(classModalityNotifier.notifier)
                .updateSelectedModalities(x);
          }
          setState(() {});
        },
        // childBuilder: ,
        options: widget.options,
        selectedValues: getValues(),
        whenEmpty: widget.label,
      ),
    );
  }
}
