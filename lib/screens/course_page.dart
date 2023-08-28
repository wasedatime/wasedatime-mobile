import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wasedatime/models/cache_course.dart';

class CoursePage extends StatelessWidget {
  final CacheCourse course;

  const CoursePage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: LayoutBuilder(builder: (context, constraints) {
        final Size size = MediaQuery.of(context).size;
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.05),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue, // Border color
                width: 2.0, // Border width
              ),
              borderRadius: BorderRadius.circular(10.0), // Border radius
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.025, vertical: size.height * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     IconButton(
                  //       onPressed: () {
                  //         Navigator.pop(context); // Navigate back
                  //       },
                  //       icon: const Icon(
                  //         Icons.arrow_back_ios,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    height: size.height * 0.12,
                    child: AutoSizeText(
                      course.courseTitle,
                      style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontFamily: 'Segoe UI',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    'Instructor: ${course.courseInstructor}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Term: ${course.courseTerm}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  // Add more details as needed
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
