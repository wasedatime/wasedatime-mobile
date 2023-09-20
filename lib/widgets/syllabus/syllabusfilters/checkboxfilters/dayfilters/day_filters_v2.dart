import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/checkboxProviders/day_filter_provider.dart';
import './day.dart';

class DayFiltersV2 extends ConsumerStatefulWidget {
  const DayFiltersV2({super.key});

  @override
  ConsumerState<DayFiltersV2> createState() => _DayFiltersV2State();
}

class _DayFiltersV2State extends ConsumerState<DayFiltersV2> {
  @override
  Widget build(BuildContext context) {
    final selectedDays = ref.watch(daysFilterNotifier);

    return SizedBox(
      width: double.infinity,
      child: Column(children: [
        Row(
          children: [
            FilterDay(
              selectDay: Day.monday,
              selectValue: selectedDays[Day.monday]!,
              label: "Mon",
            ),
            const Spacer(),
            FilterDay(
                selectDay: Day.tuesday,
                selectValue: selectedDays[Day.tuesday]!,
                label: "Tue"),
            const Spacer(),
            FilterDay(
                selectDay: Day.wednesday,
                selectValue: selectedDays[Day.wednesday]!,
                label: "Wed")
          ],
        ),
        Row(
          children: [
            FilterDay(
              selectDay: Day.thursday,
              selectValue: selectedDays[Day.thursday]!,
              label: "Thu",
            ),
            const Spacer(),
            FilterDay(
                selectDay: Day.friday,
                selectValue: selectedDays[Day.friday]!,
                label: "Fri"),
            const Spacer(),
            FilterDay(
                selectDay: Day.saturday,
                selectValue: selectedDays[Day.saturday]!,
                label: "Sat")
          ],
        ),
      ]),
    );
  }
}
