import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/credit_filter_provider.dart';

import 'credit.dart';

class CreditFiltersV2 extends ConsumerStatefulWidget {
  const CreditFiltersV2({super.key});

  @override
  ConsumerState<CreditFiltersV2> createState() => _CreditFiltersV2State();
}

class _CreditFiltersV2State extends ConsumerState<CreditFiltersV2> {
  @override
  Widget build(BuildContext context) {
    final selectedCredits = ref.watch(creditsFilterNotifier);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CreditFilter(
                  selectCredit: 1,
                  selectValue: selectedCredits[1]!,
                  label: "1"),
              const Spacer(),
              CreditFilter(
                  selectCredit: 2,
                  selectValue: selectedCredits[2]!,
                  label: "2"),
              const Spacer(),
              CreditFilter(
                  selectCredit: 3,
                  selectValue: selectedCredits[3]!,
                  label: "3+"),
            ],
          ),
        ],
      ),
    );
  }
}
