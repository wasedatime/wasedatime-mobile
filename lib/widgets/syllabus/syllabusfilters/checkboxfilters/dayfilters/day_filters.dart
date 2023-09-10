import 'package:flutter/material.dart';

class DayFilters extends StatefulWidget {
  final Map<int, bool> selectedDays;
  const DayFilters({super.key, required this.selectedDays});

  @override
  State<DayFilters> createState() => _DayFiltersState();
}

class _DayFiltersState extends State<DayFilters> {
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
                      value: widget.selectedDays[1],
                      onChanged: (value) {
                        setState(() {
                          widget.selectedDays[1] = value!;
                        });
                      }),
                  SizedBox(
                    width: size.width * 0.08,
                    child: const Text(
                      "Mon",
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
                      value: widget.selectedDays[2],
                      onChanged: (value) {
                        setState(() {
                          widget.selectedDays[2] = value!;
                        });
                      }),
                  SizedBox(
                    width: size.width * 0.08,
                    child: const Text(
                      "Tue",
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
                      value: widget.selectedDays[3],
                      onChanged: (value) {
                        setState(() {
                          widget.selectedDays[3] = value!;
                        });
                      }),
                  SizedBox(
                    width: size.width * 0.08,
                    child: const Text(
                      "Wed",
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
                      value: widget.selectedDays[4],
                      onChanged: (value) {
                        setState(() {
                          widget.selectedDays[4] = value!;
                        });
                      }),
                  SizedBox(
                    width: size.width * 0.08,
                    child: const Text(
                      "Thu",
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
                      value: widget.selectedDays[5],
                      onChanged: (value) {
                        setState(() {
                          widget.selectedDays[5] = value!;
                        });
                      }),
                  SizedBox(
                    width: size.width * 0.08,
                    child: const Text(
                      "Fri",
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
                      value: widget.selectedDays[6],
                      onChanged: (value) {
                        setState(() {
                          widget.selectedDays[6] = value!;
                        });
                      }),
                  SizedBox(
                    width: size.width * 0.08,
                    child: const Text(
                      "Sat",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]));
  }
}
