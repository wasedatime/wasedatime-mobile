import 'package:flutter/material.dart';

class PeriodFilters extends StatefulWidget {
  final Map<int, bool> selectedPeriods;
  const PeriodFilters({super.key, required this.selectedPeriods});

  @override
  State<PeriodFilters> createState() => _PeriodFiltersState();
}

class _PeriodFiltersState extends State<PeriodFilters> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: double.infinity,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -2),
                  value: widget.selectedPeriods[1],
                  onChanged: (value) {
                    setState(() {
                      widget.selectedPeriods[1] = value!;
                    });
                  }),
              const Text(
                "1",
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -2),
                  value: widget.selectedPeriods[2],
                  onChanged: (value) {
                    setState(() {
                      widget.selectedPeriods[2] = value!;
                    });
                  }),
              const Text(
                "2",
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -2),
                  value: widget.selectedPeriods[3],
                  onChanged: (value) {
                    setState(() {
                      widget.selectedPeriods[3] = value!;
                    });
                  }),
              const Text(
                "3",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -2),
                  value: widget.selectedPeriods[4],
                  onChanged: (value) {
                    setState(() {
                      widget.selectedPeriods[4] = value!;
                    });
                  }),
              const Text(
                "4",
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -2),
                  value: widget.selectedPeriods[5],
                  onChanged: (value) {
                    setState(() {
                      widget.selectedPeriods[5] = value!;
                    });
                  }),
              const Text(
                "5",
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -2),
                  value: widget.selectedPeriods[6],
                  onChanged: (value) {
                    setState(() {
                      widget.selectedPeriods[6] = value!;
                    });
                  }),
              const Text(
                "6",
              ),
            ],
          ),
        ]));
    ;
  }
}
