import 'package:flutter/material.dart';

class FilterCheckBoxes extends StatefulWidget {
  final Map<dynamic, bool> options;
  final MapEntry day;

  const FilterCheckBoxes({super.key, required this.options, required this.day});

  @override
  State<FilterCheckBoxes> createState() => _FilterCheckBoxesState();
}

class _FilterCheckBoxesState extends State<FilterCheckBoxes> {
  @override
  Widget build(BuildContext context) {
    // return Checkbox(value: true, onChanged: () {});
    return Container(
      child: CheckboxListTile(
        title: Text(widget.day.key),
        value: widget.day.value,
        onChanged: (bool? value) {
          setState(() {});
        },
      ),
    );
  }
}
