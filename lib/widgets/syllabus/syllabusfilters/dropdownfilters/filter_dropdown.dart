import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';

class FilterDropdown extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  final List<String> selectedValues;
  const FilterDropdown(
      {super.key,
      required this.label,
      required this.options,
      required this.selectedValues});

  @override
  ConsumerState<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends ConsumerState<FilterDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect(
      onChanged: (List<String> x) {
        // setState(() {
        //   selectedSemesters = x;
        // });
      },
      // childBuilder: ,
      options: widget.options,
      selectedValues: widget.selectedValues,
      whenEmpty: widget.label,
    );
  }
}
