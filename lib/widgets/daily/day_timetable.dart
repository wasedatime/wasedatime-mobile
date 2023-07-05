import 'package:flutter/material.dart';
import 'package:wasedatime/models/course.dart';

class DayTimeTable extends StatelessWidget {
  final List<List<String>> times; // List of times
  final Map<int, Course> classes;

  const DayTimeTable({Key? key, required this.times, required this.classes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    int timetableLength = 7;
    if (classes[5]?.courseTitle == null && classes[6]?.courseTitle == null) {
      timetableLength = 5;
    }

    return SizedBox(
      width: size.width * 0.9,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1), // Set the width of the first column to 1 flex
          1: FlexColumnWidth(
              3.5), // Set the width of the second column to 2 flex
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        //border: TableBorder.all(),
        children: List<TableRow>.generate(
          timetableLength,
          (index) {
            final time = times[index];
            final classItem = classes[index];

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
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.03,
                        horizontal: size.width * 0.05,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: classItem?.courseTitle != null
                            ? const Color(0xffcffafe)
                            : null,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          classItem?.courseTitle ?? " ",
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
