import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/class_modality_provider.dart';

class ClassModalityDropdown extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  const ClassModalityDropdown(
      {super.key, required this.label, required this.options});

  @override
  ConsumerState<ClassModalityDropdown> createState() =>
      _ClassModalityDropdownState();
}

class _ClassModalityDropdownState extends ConsumerState<ClassModalityDropdown> {
  List<String> _currentSelectedClassModalities = [];

  @override
  Widget build(BuildContext context) {
    List<String> _getValues() {
      _currentSelectedClassModalities =
          ref.read(classModalityNotifier.notifier).currentSelectedModalities;
      safePrint(_currentSelectedClassModalities);

      return _currentSelectedClassModalities;
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
          // safePrint(x);
          if (widget.label == 'Select Semesters') {
            ref
                .read(classModalityNotifier.notifier)
                .updateSelectedModalities(x);
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
