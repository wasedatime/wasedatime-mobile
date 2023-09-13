import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';
import 'package:wasedatime/widgets/syllabus/providers/semester_provider.dart';

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
    final selectedSemesters = ref.watch(semesterFilterNotifier);

    return DropDownMultiSelect(
      onChanged: (List<String> x) {
        // setState(() {
        //   selectedSemesters = x;
        // });
        // ref.read(semesterFilterNotifier.notifier)
        // .updateSelectedSemesters(widget.selectedValues
        // , newValue)
        // selectedValues = x;
        safePrint(x);
        ref.read(semesterFilterNotifier.notifier).updateSelectedSemesters(x);
      },
      // childBuilder: ,
      options: widget.options,
      selectedValues: widget.selectedValues,
      whenEmpty: widget.label,
    );
  }
}
