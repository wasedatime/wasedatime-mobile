import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wasedatime/models/course.dart';

class DayTimeTable extends StatelessWidget {
  final List<List<String>> times; // List of times
  final Map<int, List<Course>> classes;

  const DayTimeTable({Key? key, required this.times, required this.classes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    int timetableLength = 7;
    if ((classes[5]?.isEmpty ?? true) && (classes[6]?.isEmpty ?? true)) {
      timetableLength = 5;
    }

    return SizedBox(
      width: size.width * 0.9,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1), // Set the width of the first column to 1 flex
          1: FlexColumnWidth(4), // Set the width of the second column to 2 flex
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        //border: TableBorder.all(),
        children: List<TableRow>.generate(
          timetableLength,
          (index) {
            final time = times[index];
            final classItems = classes[index];

            List<Widget> classWidgets = [];

            if (!(classItems?.isEmpty ?? true)) {
              classWidgets = classItems!.map((classItem) {
                return Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.015,
                      horizontal: size.width * 0.05,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.04),
                      color: classItem.courseTitle != null
                          ? classItem.cellColors[classItem.prefColor!]
                          : Colors.transparent,
                    ),
                    // width: size.width * 0.8,
                    height: size.height * 0.085,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.035,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              classItem.courseTitle ?? " ",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold,
                                color: classItem.courseTitle != null
                                    ? classItem.textColors[classItem.prefColor!]
                                    : Colors.transparent,
                              ),
                              maxLines: 2,
                              wrapWords: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: size.height * 0.02,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: size.height * 0.00),
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              getCourseLocation(classItem),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: size.width * 0.02,
                                  fontWeight: FontWeight.w300,
                                  color:
                                      const Color.fromARGB(255, 110, 116, 126)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList();
            } else {
              classWidgets = [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03,
                    horizontal: size.width * 0.05,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " ",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                )
              ];
            }

            return TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    size.width * 0,
                    size.height * 0,
                    size.width * 0.0,
                    index != 1 ? size.height * 0.0 : size.height * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.0,
                        ),
                        child: Text(
                          time[0],
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Inter',
                              color: Color(0xff94A3B8)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.019,
                        ),
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              color: Color(0xff94A3B8)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.0,
                        ),
                        child: Text(
                          time[1],
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Inter',
                              color: Color(0xff94A3B8)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(
                      size.width * 0,
                      size.height * 0,
                      size.width * 0.0,
                      index != 1 ? size.height * 0.0 : size.height * 0.01,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0,
                        horizontal: size.width * 0.0,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xffCCCCCC)),
                          bottom: BorderSide(color: Color(0xffCCCCCC)),
                        ),
                      ),
                      //height: size.height * 0.09,
                      child: Row(
                        children: classWidgets,
                      ),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}

String getCourseLocation(Course? course) {
  List<dynamic> occurrences = json.decode(course!.courseOccurrences!);
  return occurrences[0]['l'];
}
