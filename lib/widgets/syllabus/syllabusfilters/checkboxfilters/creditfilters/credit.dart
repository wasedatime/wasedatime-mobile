import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/providers/checkboxProviders/credit_filter_provider.dart';

class CreditFilter extends ConsumerStatefulWidget {
  final int selectCredit;
  final bool selectValue;
  final String label;
  const CreditFilter(
      {super.key,
      required this.selectCredit,
      required this.selectValue,
      required this.label});

  @override
  ConsumerState<CreditFilter> createState() => _FilterDayState();
}

class _FilterDayState extends ConsumerState<CreditFilter> {
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
                  .read(creditsFilterNotifier.notifier)
                  .updateCreditFilters(widget.selectCredit, widget.selectValue);
            }),
        SizedBox(
          width:
              widget.selectCredit == 3 ? size.width * 0.05 : size.width * 0.04,
          child: Text(widget.label),
        ),
      ],
    );
  }
}
