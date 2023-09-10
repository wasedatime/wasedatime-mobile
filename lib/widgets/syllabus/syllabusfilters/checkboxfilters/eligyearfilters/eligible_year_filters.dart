import 'package:flutter/material.dart';

class EligibleYearFilters extends StatefulWidget {
  final Map<int, bool> selectedEligibleYear;

  const EligibleYearFilters({super.key, required this.selectedEligibleYear});

  @override
  State<EligibleYearFilters> createState() => _EligibleYearFiltersState();
}

class _EligibleYearFiltersState extends State<EligibleYearFilters> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
            value: widget.selectedEligibleYear[1],
            onChanged: (value) {
              setState(() {
                widget.selectedEligibleYear[1] = value!;
              });
            }),
        const Text(
          "1+",
        ),
        SizedBox(
          width: size.width * 0.1,
        ),
        Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
            value: widget.selectedEligibleYear[2],
            onChanged: (value) {
              setState(() {
                widget.selectedEligibleYear[2] = value!;
              });
            }),
        const Text(
          "2+",
        ),
        SizedBox(
          width: size.width * 0.1,
        ),
        Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
            value: widget.selectedEligibleYear[3],
            onChanged: (value) {
              setState(() {
                widget.selectedEligibleYear[3] = value!;
              });
            }),
        const Text(
          "3+",
        ),
      ],
    );
  }
}
