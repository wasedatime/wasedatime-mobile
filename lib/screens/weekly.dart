import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wasedatime/widgets/weekly/display_periodcell.dart';
import 'package:wasedatime/widgets/weekly/display_timingcells.dart';

import '../models/course.dart';
import '../utils/db_helper.dart';

class WeekScreen extends StatefulWidget {
  const WeekScreen({super.key});

  @override
  State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  // late final Future<Map<int, Map<int, Course>>> coursesFuture;
  // Map<int, Map<int, Course>>? courses;
  late final Future<Map<int, Map<int, Course>>> springCoursesFuture;
  Map<int, Map<int, Course>>? springCourses;
  late final Future<Map<int, Map<int, Course>>> fallCoursesFuture;
  Map<int, Map<int, Course>>? fallCourses;

  List<String> springTerms = ['0s', '0q', '1q'];
  List<String> fallTerms = ['2s', '2q', '3q'];

  late String currentSemester;

  void setCurrentSemester() {
    if (currentSemester == 'Spring') {
      currentSemester = 'Fall';
      _fetchFallCourses();
    } else {
      currentSemester = 'Spring';
      _fetchSpringCourses();
    }
    safePrint(currentSemester);
    setState(() {});
  }

  void _fetchSpringCourses() async {
    springCourses = await springCoursesFuture;
    for (int period = 0; period < springCourses!.length; period++) {
      for (int day = 2; day < 6; day++) {
        safePrint(springCourses?[period]?[day]?.courseTitle);
      }
      safePrint("");
    }

    setState(() {});
  }

  void _fetchFallCourses() async {
    fallCourses = await fallCoursesFuture;
    for (int period = 0; period < fallCourses!.length; period++) {
      for (int day = 2; day < 6; day++) {
        safePrint(fallCourses?[period]?[day]?.courseTitle);
      }
      safePrint("");
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    springCoursesFuture =
        DatabaseHelper.instance.getCoursesForWeek(springTerms);
    fallCoursesFuture = DatabaseHelper.instance.getCoursesForWeek(fallTerms);
    safePrint('courses future');

    if (DateTime.now().month >= 3 && DateTime.now().month <= 8) {
      currentSemester = 'Spring';
      _fetchSpringCourses();
    } else {
      currentSemester = 'Fall';
      _fetchFallCourses();
    }
  }

  @override
  Widget build(BuildContext context) {
    const Map<int, List> timings = {
      1: ["8:50", "10:30"],
      2: ["10:40", "12:20"],
      3: ["13:10", "14:50"],
      4: ["15:05", "16:45"],
      5: ["17:00", "18:40"]
    };

    String getCourseLocation(Course? course) {
      List<dynamic> occurrences = json.decode(course!.courseOccurrences!);
      return occurrences[0]['l'];
    }

    const List days = ["Mon", "Tue", "Wed", "Thu", "Fri"];
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xFFEFEFEF),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0.0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentSemester != 'Spring'
                  ? IconButton(
                      iconSize: size.width * 0.1,
                      icon: const Icon(
                        Icons.keyboard_double_arrow_left,
                        color: Color(0xFFBF2D42),
                      ),
                      onPressed: () {
                        setCurrentSemester();
                      },
                      splashColor: Colors.white,
                    )
                  : Icon(
                      size: size.width * 0.1,
                      Icons.keyboard_double_arrow_left,
                      color: Colors.grey,
                    ),
              const Spacer(),
              Text(
                "$currentSemester Semester",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: size.width * 0.055,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              currentSemester == 'Spring'
                  ? IconButton(
                      iconSize: size.width * 0.1,
                      icon: const Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Color(0xFFBF2D42),
                      ),
                      onPressed: () {
                        setCurrentSemester();
                      },
                      splashColor: Colors.white,
                    )
                  : Icon(
                      size: size.width * 0.1,
                      Icons.keyboard_double_arrow_right,
                      color: Colors.grey,
                    ),
            ],
          ),
        ),
        body: SizedBox(
          height: size.height * 0.88,
          child: Column(
            children: [
              Expanded(
                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(size.width * 0.1),
                    1: const FlexColumnWidth(),
                    2: const FlexColumnWidth(),
                    3: const FlexColumnWidth(),
                    4: const FlexColumnWidth(),
                    5: const FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: null,
                  children: <TableRow>[
                    TableRow(children: [
                      TableCell(
                        child: Text(
                          "",
                          style: TextStyle(fontSize: size.width * 0.01),
                        ),
                      ),
                      for (int i = 0; i <= 4; i++)
                        TableCell(
                          child: Center(
                              child: Text(
                            days[i],
                            style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontFamily: 'Inter',
                                color:
                                    const Color.fromARGB(255, 127, 139, 156)),
                          )),
                        ),
                    ]),
                    TableRow(children: [
                      // Spacer row between day and table
                      for (int j = 1; j <= 6; j++)
                        TableCell(
                            child: Text(
                          "",
                          style: TextStyle(fontSize: size.width * 0.005),
                        ))
                    ]),
                    // print time table
                    for (int period = 1; period <= 5; period++)
                      TableRow(
                        children: [
                          for (int day = 1; day <= 6; day++)
                            day != 1
                                ? PeriodCell(
                                    courses: currentSemester == 'Spring'
                                        ? springCourses
                                        : fallCourses,
                                    period: period,
                                    day: day,
                                    getCourseLocation: getCourseLocation,
                                    size: size)
                                : TimingCells(period: period, timings: timings),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
