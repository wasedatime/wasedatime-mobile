import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/checkboxProviders/day_filter_provider.dart';

class FilterDay extends ConsumerStatefulWidget {
  final Day selectDay;
  final bool selectValue;
  final String label;
  const FilterDay(
      {super.key,
      required this.selectDay,
      required this.selectValue,
      required this.label});

  @override
  ConsumerState<FilterDay> createState() => _FilterDayState();
}

class _FilterDayState extends ConsumerState<FilterDay> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final selectedDays = ref.watch(daysFilterNotifier);

    return Row(
      children: [
        Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
            value: widget.selectValue,
            onChanged: (value) {
              // setState(() {
              //   widget.selectedDays[1] = value!;
              // });
              ref
                  .read(daysFilterNotifier.notifier)
                  .updateDay(widget.selectDay, widget.selectValue);
            }),
        SizedBox(
          width: size.width * 0.1,
          child: Text(widget.label),
        ),
      ],
    );
  }
}
