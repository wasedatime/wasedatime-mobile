import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/elig_year_provider.dart';
import 'eligyear.dart';

class EligibleYearFiltersV2 extends ConsumerStatefulWidget {
  const EligibleYearFiltersV2({super.key});

  @override
  ConsumerState<EligibleYearFiltersV2> createState() =>
      _EligibleYearFiltersV2State();
}

class _EligibleYearFiltersV2State extends ConsumerState<EligibleYearFiltersV2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final selectedEligibleYears = ref.watch(eligibleYearsFilterNotifier);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              EligibleYear(
                  selectYear: 1,
                  selectValue: selectedEligibleYears[1]!,
                  label: "1+"),
              const Spacer(),
              EligibleYear(
                  selectYear: 2,
                  selectValue: selectedEligibleYears[2]!,
                  label: "2+"),
              const Spacer(),
              EligibleYear(
                  selectYear: 3,
                  selectValue: selectedEligibleYears[3]!,
                  label: "3+"),
              const Spacer(),
              EligibleYear(
                  selectYear: 4,
                  selectValue: selectedEligibleYears[4]!,
                  label: "4+"),
            ],
          ),
        ],
      ),
    );
  }
}
