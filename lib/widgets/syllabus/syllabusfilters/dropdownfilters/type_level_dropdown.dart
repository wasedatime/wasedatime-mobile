import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/type_level_provider.dart';

class TypeAndLevelDropdown extends ConsumerStatefulWidget {
  final String label;
  final List<String> listOptions;
  const TypeAndLevelDropdown(
      {super.key, required this.label, required this.listOptions});

  @override
  ConsumerState<TypeAndLevelDropdown> createState() =>
      _TypeAndLevelDropdownState();
}

class _TypeAndLevelDropdownState extends ConsumerState<TypeAndLevelDropdown> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.listOptions.first;
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
        disabledHint: widget.label == 'type'
            ? const Text("Select Type")
            : const Text("Select Level"),
        value: dropdownValue,
        onChanged: (newValue) {
          if (widget.label == 'type') {
            ref
                .watch(typeAndLevelNotifier.notifier)
                .updateSelectedTypeAndLevel(updatedType: newValue);
          }
          if (widget.label == 'level') {
            ref
                .watch(typeAndLevelNotifier.notifier)
                .updateSelectedTypeAndLevel(updatedLevel: newValue);
          }
          setState(() {
            dropdownValue = newValue!;
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
