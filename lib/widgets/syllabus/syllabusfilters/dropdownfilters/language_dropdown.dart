import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/language_provider.dart';

class LanguagesDropdown extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  final List<String> selectedValues;
  const LanguagesDropdown(
      {super.key,
      required this.label,
      required this.options,
      required this.selectedValues});

  @override
  ConsumerState<LanguagesDropdown> createState() => _LanguagesDropdownState();
}

class _LanguagesDropdownState extends ConsumerState<LanguagesDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect(
      onChanged: (List<String> x) {
        safePrint(x);
        ref.read(languageFilterNotifier.notifier).updateSelectedLanguages(x);
      },
      // childBuilder: ,
      options: widget.options,
      selectedValues: widget.selectedValues,
      whenEmpty: widget.label,
    );
  }
}
