import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/elig_year_provider.dart';

class EligibleYear extends ConsumerStatefulWidget {
  final int selectYear;
  final bool selectValue;
  final String label;
  const EligibleYear(
      {super.key,
      required this.selectYear,
      required this.selectValue,
      required this.label});

  @override
  ConsumerState<EligibleYear> createState() => _FilterDayState();
}

class _FilterDayState extends ConsumerState<EligibleYear> {
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
                  .read(eligibleYearsFilterNotifier.notifier)
                  .updateEligibleYear(widget.selectYear, widget.selectValue);
            }),
        SizedBox(
          width: size.width * 0.05,
          child: Text(widget.label),
        ),
      ],
    );
  }
}
