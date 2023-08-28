import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../models/course.dart';

class PeriodCell extends StatelessWidget {
  final Map<int, Map<int, Course>>? courses;
  final int period;
  final int day;
  final Size size;
  final String Function(Course? course) getCourseLocation;

  const PeriodCell(
      {super.key,
      required this.courses,
      required this.period,
      required this.day,
      required this.getCourseLocation,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.01, vertical: size.height * 0.003),
        padding: EdgeInsets.all(size.width * 0.01),
        alignment: Alignment.center,
        height: size.height * 0.14,
        decoration: BoxDecoration(
          color: courses?[period]?[day]?.courseID == null
              ? Colors.grey[100]
              : courses![period]![day]!
                  .cellColors[courses![period]![day]!.prefColor!],
          borderRadius: BorderRadius.circular(size.width * 0.04),
        ),
        child: courses?[period]?[day]?.courseID == null
            ? const Text(" ")
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    '${courses?[period]?[day]?.courseTitle}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: size.width * 0.029,
                        color: courses![period]![day]!
                            .textColors[courses![period]![day]!.prefColor!],
                        overflow: TextOverflow.ellipsis),
                    maxLines: 5,
                  ),
                  AutoSizeText(
                    getCourseLocation(courses?[period]?[day]),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: size.width * 0.025,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
      ),
    );
  }
}
