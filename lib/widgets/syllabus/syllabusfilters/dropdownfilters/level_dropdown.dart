import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/type_level_provider.dart';

class LevelDropdown extends ConsumerStatefulWidget {
  final List<String> listOptions;
  const LevelDropdown({super.key, required this.listOptions});

  @override
  ConsumerState<LevelDropdown> createState() => _LevelDropdownState();
}

class _LevelDropdownState extends ConsumerState<LevelDropdown> {
  String _currentDropdownValue = "Select Level";
  String getCurrentDropdownValue() {
    _currentDropdownValue =
        ref.read(typeAndLevelNotifier.notifier).currentLevel;

    return _currentDropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            isCollapsed: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54))),
        isExpanded: true,
        disabledHint: const Text("Select Level"),
        value: getCurrentDropdownValue(),
        onChanged: (newValue) {
          ref
              .read(typeAndLevelNotifier.notifier)
              .updateSelectedTypeAndLevel(updatedLevel: newValue);

          setState(() {
            _currentDropdownValue = newValue!;
          });
        },
        items: widget.listOptions.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
