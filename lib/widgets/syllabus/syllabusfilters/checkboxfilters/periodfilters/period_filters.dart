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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
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
                  SizedBox(
                    width: size.width * 0.04,
                    child: const Text(
                      "1",
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
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
                  SizedBox(
                    width: size.width * 0.04,
                    child: const Text(
                      "2",
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
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
                  SizedBox(
                    width: size.width * 0.04,
                    child: const Text(
                      "3",
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
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
                  SizedBox(
                    width: size.width * 0.04,
                    child: const Text(
                      "4",
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
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
                  SizedBox(
                    width: size.width * 0.04,
                    child: const Text(
                      "5",
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
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
                  SizedBox(
                    width: size.width * 0.04,
                    child: const Text(
                      "6",
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -2),
                      value: widget.selectedPeriods[7],
                      onChanged: (value) {
                        setState(() {
                          widget.selectedPeriods[7] = value!;
                        });
                      }),
                  const Text(
                    "7",
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.22,
              )
            ],
          ),
        ]));
  }
}
