import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/dropdownProviders/type_level_provider.dart';

class TypeDropdown extends ConsumerStatefulWidget {
  final List<String> listOptions;
  const TypeDropdown({super.key, required this.listOptions});

  @override
  ConsumerState<TypeDropdown> createState() => _TypeDropdownState();
}

class _TypeDropdownState extends ConsumerState<TypeDropdown> {
  String _currentDropdownValue = "Select Type";

  String getCurrentDropdownValue() {
    String _currentDropdownValue =
        ref.read(typeAndLevelNotifier.notifier).currentType;

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
        disabledHint: const Text("Select Type"),
        value: getCurrentDropdownValue(),
        onChanged: (newValue) {
          ref
              .read(typeAndLevelNotifier.notifier)
              .updateSelectedTypeAndLevel(updatedType: newValue);
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
