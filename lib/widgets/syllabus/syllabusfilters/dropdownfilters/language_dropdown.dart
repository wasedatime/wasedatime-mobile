import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiselect/multiselect.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/language_provider.dart';

class LanguagesDropdown extends ConsumerStatefulWidget {
  final String label;
  final List<String> options;
  const LanguagesDropdown({
    super.key,
    required this.label,
    required this.options,
  });

  @override
  ConsumerState<LanguagesDropdown> createState() => _LanguagesDropdownState();
}

class _LanguagesDropdownState extends ConsumerState<LanguagesDropdown> {
  List<String> _currentSelectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    List<String> _getValues() {
      _currentSelectedLanguages =
          ref.read(languageFilterNotifier.notifier).currentSelectedLanguages;
      safePrint(_currentSelectedLanguages);

      return _currentSelectedLanguages;
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
          ref.read(languageFilterNotifier.notifier).updateSelectedLanguages(x);

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
