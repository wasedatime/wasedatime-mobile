import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:wasedatime/widgets/daily/day_timetable.dart';
import 'package:wasedatime/utils/db_helper.dart';
import 'package:wasedatime/models/course.dart';
import 'package:wasedatime/models/class_times.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({Key? key}) : super(key: key);

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  late final Future<Map<int, List<Course>>> coursesFuture;
  Map<int, List<Course>>? courses;
  int numberOfClasses = 0;
  int nextClassPeriod = 0;

  @override
  void initState() {
    super.initState();
    coursesFuture =
        //DatabaseHelper.instance.getCoursesForDay(DateTime.now().weekday);
        DatabaseHelper.instance.getCoursesForDay(2);
    _fetchCourses();
  }

  void _fetchCourses() async {
    try {
      courses = await coursesFuture;
      numberOfClasses = _countNonNullClasses(courses);
      nextClassPeriod = _calculateNextClassPeriod(courses);
    } catch (error) {
      // Handle error
    }

    setState(() {}); // Trigger a rebuild to update the screen
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String greeting = _getGreeting(now);
    final String formattedDate = DateFormat('MMMM dd, yyyy').format(now);

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final Size size = MediaQuery.of(context).size;
          return Column(
            children: [
              // Greeting and Date in the top row
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: constraints.maxHeight * 0.05),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.06,
                      vertical: size.height * 0.035,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          greeting,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontFamily: 'Segoe UI',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Box with text
              Padding(
                padding: EdgeInsets.fromLTRB(
                  size.width * 0,
                  size.height * 0.01,
                  size.width * 0,
                  size.height * 0.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.06,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFCCCCCC),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.05),
                          ),
                          padding: EdgeInsets.all(size.width * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (numberOfClasses != 0) ...[
                                if (numberOfClasses == 1)
                                  Text(
                                    'Today you have $numberOfClasses class,',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: size.width * 0.061,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                else
                                  Text(
                                    'Today you have $numberOfClasses classes,',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: size.width * 0.061,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                SizedBox(height: size.height * 0.005),
                                if (nextClassPeriod == -1)
                                  Text(
                                    'No more classes for the day',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: size.width * 0.061,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                else
                                  Text(
                                    'Next class is period $nextClassPeriod',
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: size.width * 0.061,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                              ] else ...[
                                Text(
                                  'You have no classes today.',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: size.width * 0.07,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),

              // Main content centered with scrollable timetable
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0,
                        size.height * 0.02,
                        size.width * 0.1,
                        size.height * 0.03,
                      ),
                      child: DayTimeTable(
                        times: const [
                          ['08:50', '10:30'],
                          ['10:40', '12:20'],
                          ['13:10', '14:50'],
                          ['15:05', '16:45'],
                          ['17:00', '18:40'],
                          ['18:55', '20:35'],
                          ['20:45', '21:35']
                        ],
                        classes: courses ?? {},
                      )),
                ),
              ),
              SizedBox(height: size.height * 0.1),
            ],
          );
        },
      ),
    );
  }

  String _getGreeting(DateTime now) {
    final int hour = now.hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  // Count the number of non-null classes in the courses map
  int _countNonNullClasses(Map<int, List<Course>>? courses) {
    int count = 0;
    for (final course in courses?.values.toList() ?? []) {
      if (course.courseTitle != null) {
        count++;
      }
    }
    return count;
  }

  // Calculate the next class period based on the current time and the classes
  int _calculateNextClassPeriod(Map<int, List<Course>>? courses) {
    final DateTime now = DateTime.now();
    List<DateTimeRange> classTimes = ClassTimes.getClassTimes(now);

    // Find the first class range that hasn't ended yet
    for (int i = 0; i < classTimes.length; i++) {
      final DateTimeRange classRange = classTimes[i];
      if (now.isBefore(classRange.start) && courses?[i]?[0].id != null) {
        return i + 1; // Return the class period (index + 1)
      }
    }
    return -1;
  }
}
