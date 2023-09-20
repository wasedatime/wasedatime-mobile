import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/semester_provider.dart';

class SemesterDropdown extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  final List<String> selectedValues;
  const SemesterDropdown(
      {super.key,
      required this.label,
      required this.options,
      required this.selectedValues});

  @override
  ConsumerState<SemesterDropdown> createState() => _SemesterDropdownState();
}

class _SemesterDropdownState extends ConsumerState<SemesterDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: DropDownMultiSelect(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            isCollapsed: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45))),
        onChanged: (List<String> x) {
          safePrint(x);
          ref.read(semesterFilterNotifier.notifier).updateSelectedSemesters(x);
        },
        // childBuilder: ,
        options: widget.options,
        selectedValues: widget.selectedValues,
        whenEmpty: widget.label,
      ),
    );
  }
}
