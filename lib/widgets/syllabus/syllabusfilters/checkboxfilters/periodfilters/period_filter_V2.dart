import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/checkboxProviders/period_filter_provider.dart';

import 'period.dart';

class PeriodsFiltersV2 extends ConsumerStatefulWidget {
  const PeriodsFiltersV2({super.key});

  @override
  ConsumerState<PeriodsFiltersV2> createState() => _PeriodsFiltersV2State();
}

class _PeriodsFiltersV2State extends ConsumerState<PeriodsFiltersV2> {
  @override
  Widget build(BuildContext context) {
    final selectedPeriods = ref.watch(periodsFilterNotifier);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FilterPeriod(
                  selectPeriod: 1,
                  selectValue: selectedPeriods[1]!,
                  label: "1"),
              const Spacer(),
              FilterPeriod(
                  selectPeriod: 2,
                  selectValue: selectedPeriods[2]!,
                  label: "2"),
              const Spacer(),
              FilterPeriod(
                  selectPeriod: 3,
                  selectValue: selectedPeriods[3]!,
                  label: "3"),
              const Spacer(),
              FilterPeriod(
                  selectPeriod: 4,
                  selectValue: selectedPeriods[4]!,
                  label: "4"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FilterPeriod(
                  selectPeriod: 5,
                  selectValue: selectedPeriods[5]!,
                  label: "5"),
              const Spacer(),
              FilterPeriod(
                  selectPeriod: 6,
                  selectValue: selectedPeriods[6]!,
                  label: "6"),
              const Spacer(),
              FilterPeriod(
                  selectPeriod: 7,
                  selectValue: selectedPeriods[7]!,
                  label: "7"),
              const Spacer(),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
