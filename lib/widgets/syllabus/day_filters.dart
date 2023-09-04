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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const Text(
                "Mon",
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
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
              const Text(
                "Tue",
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
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
              const Text(
                "Wed",
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
                  value: widget.selectedDays[4],
                  onChanged: (value) {
                    setState(() {
                      widget.selectedDays[4] = value!;
                    });
                  }),
              const Text(
                "Thu",
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
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
              const Text(
                "Fri",
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
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
              const Text(
                "Wed",
              ),
            ],
          ),
        ]));
  }
}
