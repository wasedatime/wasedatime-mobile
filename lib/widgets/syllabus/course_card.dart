import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:wasedatime/models/course.dart';
import 'package:wasedatime/models/cache_course.dart';
import 'package:wasedatime/screens/course_page.dart';
import 'package:wasedatime/utils/db_helper.dart';

class CourseCard extends StatefulWidget {
  final CacheCourse course;
  const CourseCard({required this.course, Key? key}) : super(key: key);
  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool isAdded = false;

  void checkCourseAdded() async {
    isAdded =
        await DatabaseHelper.instance.isCourseIdExists(widget.course.courseID);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkCourseAdded();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<Map<String, dynamic>> occurrencesList =
        List<Map<String, dynamic>>.from(
            json.decode(widget.course.courseOccurrences));

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursePage(course: widget.course),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.005),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(size.width * 0.05))),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.008),
            alignment: Alignment.center,
            //height: size.height * 0.215,
            width: size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.005),
                      width: size.width * 0.6,
                      child: Text(
                        widget.course.courseTitle,
                        style: TextStyle(
                            color: const Color(0xff8E1728),
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * 0.04,
                            fontFamily: 'Segoe UI',
                            letterSpacing: size.width * 0.0015),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.005),
                      child: Image(
                          //NEED TO IMPLEMENT AUTOMATICALLY SOMEHOW
                          image: AssetImage(
                              'assets/images/schools/undergraduate/${widget.course.courseSchool.toLowerCase()}.png'),
                          fit: BoxFit.scaleDown,
                          width: size.width * 0.08),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.005),
                      child: Image(
                          image: const AssetImage(
                              'assets/images/en-lang.png'), //NEED TO FIX
                          fit: BoxFit.scaleDown,
                          width: size.width * 0.08),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: size.height * 0.001,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (var occurrence in occurrencesList)
                                    DateLocationRow(
                                      occurrence: occurrence,
                                      size: size,
                                      dayMap: widget.course.dayMap,
                                    ),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: size.height * 0.001,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.school_sharp,
                                  color: const Color(0xff7B7D7D),
                                  size: size.width * 0.05,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.002),
                                  width: size.width * 0.45,
                                  child: Text(
                                    widget.course.courseInstructor,
                                    style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: size.width * 0.04,
                                        color: const Color(0xff7B7D7D),
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(
                          milliseconds: 300), // Set your desired duration
                      transitionBuilder: (widget, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: widget,
                        );
                      },
                      child: isAdded
                          ? IconButton(
                              key: const ValueKey<bool>(
                                  true), // Use ValueKey to identify widgets
                              onPressed: () async {
                                setState(() {
                                  isAdded = false;
                                });
                                await DatabaseHelper.instance
                                    .removeCourse(widget.course.courseID);
                              },
                              iconSize: size.height * 0.05,
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              splashColor: Colors.transparent,
                            )
                          : IconButton(
                              key: const ValueKey<bool>(
                                  false), // Use ValueKey to identify widgets
                              onPressed: () async {
                                setState(() {
                                  isAdded = true;
                                });
                                await DatabaseHelper.instance.addCourse(
                                    Course.fromCacheCourse(widget.course));
                              },
                              iconSize: size.height * 0.05,
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              ),
                              splashColor: Colors.transparent,
                            ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  height: size.height * 0.001,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xff7B7D7D),
                      borderRadius: BorderRadius.circular(size.height * 0.05)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () async {
                          String url =
                              "https://www.wsl.waseda.jp/syllabus/JAA104.php?pKey=${widget.course.courseID}&pLng=en";
                          if (await canLaunchUrlString(url)) {
                            await launchUrlString(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        iconSize: size.height * 0.03,
                        icon: const Icon(
                          Icons.launch,
                          color: Colors.blue,
                        )),
                    IconButton(
                        onPressed: () {},
                        iconSize: size.height * 0.03,
                        icon: const Icon(
                          Icons.chat_bubble,
                          color: Colors.amber,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateLocationRow extends StatelessWidget {
  final Map<String, dynamic> occurrence;
  final Size size;
  final Map<int, String> dayMap; // Pass the dayMap as a parameter

  const DateLocationRow({
    super.key,
    required this.occurrence,
    required this.size,
    required this.dayMap,
  });

  @override
  Widget build(BuildContext context) {
    // Extract values from occurrence map
    String day = occurrence['d'] == -1
        ? "On-Demand"
        : dayMap[occurrence['d']] ?? "Unavailable";
    String period = _formatPeriod(occurrence['p']);
    String room = occurrence['l'];

    return Row(
      children: [
        Icon(
          Icons.access_time_filled,
          color: const Color(0xff7B7D7D),
          size: size.width * 0.05,
        ),
        SizedBox(width: size.width * 0.01),
        Text(
          "$day$period",
          style: TextStyle(
            color: const Color(0xff7B7D7D),
            fontFamily: 'Segoe UI',
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: size.width * 0.01),
        Icon(
          Icons.pin_drop_rounded,
          size: size.width * 0.05,
          color: const Color(0xff7B7D7D),
        ),
        SizedBox(width: size.width * 0.01),
        Text(
          room,
          style: TextStyle(
            fontFamily: 'Segoe UI',
            color: const Color(0xff7B7D7D),
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _formatPeriod(int period) {
    if ((period != 0 || period != -1) && 0 < period && period <= 9) {
      return period.toString();
    } else if (period > 9) {
      return "${period ~/ 10}-${period % 10}";
    }
    return "";
  }
}
