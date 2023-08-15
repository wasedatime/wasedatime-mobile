import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/course.dart';
import '../utils/db_helper.dart';
import '../widgets/syllabus/courseCard.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({Key? key}) : super(key: key);

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  late final Future<Map<int, Course>> coursesSearch;

  @override
  void initState() {
    super.initState();
    coursesSearch =
        DatabaseHelper.instance.getCoursesForDay(DateTime.wednesday);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

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
          centerTitle: false,
          title: Text(
            "Syllabus",
            style: TextStyle(fontSize: 30, color: Colors.red[900]),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              // color: Colors.amber,
              height: height * 0.75,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for a course',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.filter_alt),
                          onPressed: () {
                            // Add your filter functionality here
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CourseCard()
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            )
          ],
        ));
  }
}
