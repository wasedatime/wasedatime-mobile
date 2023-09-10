import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/period_filter_provider.dart';

class FilterPeriod extends ConsumerStatefulWidget {
  final int selectPeriod;
  final bool selectValue;
  final String label;
  const FilterPeriod(
      {super.key,
      required this.selectPeriod,
      required this.selectValue,
      required this.label});

  @override
  ConsumerState<FilterPeriod> createState() => _FilterDayState();
}

class _FilterDayState extends ConsumerState<FilterPeriod> {
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
              ref
                  .read(periodsFilterNotifier.notifier)
                  .updatePeriod(widget.selectPeriod, widget.selectValue);
            }),
        SizedBox(
          width: size.width * 0.04,
          child: Text(widget.label),
        ),
      ],
    );
  }
}
