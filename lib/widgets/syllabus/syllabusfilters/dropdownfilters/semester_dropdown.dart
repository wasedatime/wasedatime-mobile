import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/semester_provider.dart';

class SemesterDropdown extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  const SemesterDropdown({
    super.key,
    required this.label,
    required this.options,
  });

  @override
  ConsumerState<SemesterDropdown> createState() => _SemesterDropdownState();
}

class _SemesterDropdownState extends ConsumerState<SemesterDropdown> {
  List<String> _currentSelectedSemesters = [];

  @override
  Widget build(BuildContext context) {
    List<String> _getValues() {
      _currentSelectedSemesters =
          ref.read(semesterFilterNotifier.notifier).currentSelectedSemesters;
      safePrint(_currentSelectedSemesters);

      return _currentSelectedSemesters;
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
          safePrint(x);
          if (widget.label == 'Select Semesters') {
            ref
                .read(semesterFilterNotifier.notifier)
                .updateSelectedSemesters(x);
          }
          setState(() {});
        },
        // childBuilder: ,
        options: widget.options,
        selectedValues: _getValues(),
        whenEmpty: widget.label,
      ),
    );
  }
}
