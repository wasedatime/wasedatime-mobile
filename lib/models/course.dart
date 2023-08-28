import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wasedatime/models/cache_course.dart';

class Course {
  String? id;
  int? prefColor;
  bool? prefVisibility;
  String? prefDisplayLang;
  String? courseID;
  String? courseTitle;
  String? courseTitleJP;
  String? courseInstructor;
  String? courseInstructorJP;
  String? courseLanguage;
  int? courseType;
  String? courseTerm;
  String? courseOccurrences;
  int? courseMinYear;
  String? courseCategory;
  int? courseCredit;
  int? courseLevel;
  String? courseEvaluation;
  String? courseCode;
  String? courseSubtitle;
  String? courseCategoryName;
  String? courseModality;
  String? courseSchool;

  Course({
    this.id,
    this.prefColor,
    this.prefVisibility,
    this.prefDisplayLang,
    this.courseID,
    this.courseTitle,
    this.courseTitleJP,
    this.courseInstructor,
    this.courseInstructorJP,
    this.courseLanguage,
    this.courseType,
    this.courseTerm,
    this.courseOccurrences,
    this.courseMinYear,
    this.courseCategory,
    this.courseCredit,
    this.courseLevel,
    this.courseEvaluation,
    this.courseCode,
    this.courseSubtitle,
    this.courseCategoryName,
    this.courseModality,
    this.courseSchool,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'prefColor': prefColor,
      'prefVisibility': prefVisibility == true ? 1 : 0,
      'prefDisplayLang': prefDisplayLang,
      'courseID': courseID,
      'courseTitle': courseTitle,
      'courseTitleJP': courseTitleJP,
      'courseInstructor': courseInstructor,
      'courseInstructorJP': courseInstructorJP,
      'courseLanguage': courseLanguage,
      'courseType': courseType,
      'courseTerm': courseTerm,
      'courseOccurrences': courseOccurrences,
      'courseMinYear': courseMinYear,
      'courseCategory': courseCategory,
      'courseCredit': courseCredit,
      'courseLevel': courseLevel,
      'courseEvaluation': courseEvaluation,
      'courseCode': courseCode,
      'courseSubtitle': courseSubtitle,
      'courseCategoryName': courseCategoryName,
      'courseModality': courseModality,
      'courseSchool': courseSchool,
    };
  }

  /*factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'],
      prefColor: map['prefColor'],
      prefVisibility: map['prefVisibility'] == 1 ? true : false,
      prefDisplayLang: map['prefDisplayLang'],
      courseID: map['courseID'],
      courseTitle: map['courseTitle'],
      courseTitleJP: map['courseTitleJP'],
      courseInstructor: map['courseInstructor'],
      courseInstructorJP: map['courseInstructorJP'],
      courseLanguage: map['courseLanguage'],
      courseType: map['courseType'],
      courseTerm: map['courseTerm'],
      courseOccurrences: map['courseOccurrences'],
      courseMinYear: map['courseMinYear'],
      courseCategory: map['courseCategory'],
      courseCredit: map['courseCredit'],
      courseLevel: map['courseLevel'],
      courseEvaluation: map['courseEvaluation'],
      courseCode: map['courseCode'],
      courseSubtitle: map['courseSubtitle'],
      courseCategoryName: map['courseCategoryName'],
      courseModality: map['courseModality'],
      courseSchool: map['courseSchool'],
    );
  }*/

  factory Course.fromDatabaseRecord(Map<String, dynamic> record) {
    return Course(
      id: record['id'],
      prefColor: record['prefColor'],
      prefVisibility: record['prefVisibility'] == 1 ? true : false,
      prefDisplayLang: record['prefDisplayLang'],
      courseID: record['courseID'],
      courseTitle: record['courseTitle'],
      courseTitleJP: record['courseTitleJP'],
      courseInstructor: record['courseInstructor'],
      courseInstructorJP: record['courseInstructorJP'],
      courseLanguage: record['courseLanguage'],
      courseType: record['courseType'],
      courseTerm: record['courseTerm'],
      courseOccurrences: record['courseOccurrences'],
      courseMinYear: record['courseMinYear'],
      courseCategory: record['courseCategory'],
      courseCredit: record['courseCredit'],
      courseLevel: record['courseLevel'],
      courseEvaluation: record['courseEvaluation'],
      courseCode: record['courseCode'],
      courseSubtitle: record['courseSubtitle'],
      courseCategoryName: record['courseCategoryName'],
      courseModality: record['courseModality'],
      courseSchool: record['courseSchool'],
    );
  }

  @override
  String toString() {
    return 'Course(id: $id, '
        'prefColor: $prefColor, '
        'prefVisibility: $prefVisibility, '
        'prefDisplayLang: $prefDisplayLang, '
        'courseID: $courseID, '
        'courseTitle: $courseTitle, '
        'courseTitleJP: $courseTitleJP, '
        'courseInstructor: $courseInstructor, '
        'courseInstructorJP: $courseInstructorJP, '
        'courseLanguage: $courseLanguage, '
        'courseType: $courseType, '
        'courseTerm: $courseTerm, '
        'courseOccurrences: $courseOccurrences, '
        'courseMinYear: $courseMinYear, '
        'courseCategory: $courseCategory, '
        'courseCredit: $courseCredit, '
        'courseLevel: $courseLevel, '
        'courseEvaluation: $courseEvaluation, '
        'courseCode: $courseCode, '
        'courseSubtitle: $courseSubtitle, '
        'courseCategoryName: $courseCategoryName, '
        'courseModality: $courseModality, '
        'courseSchool: $courseSchool)';
  }

  factory Course.fromCacheCourse(CacheCourse cacheCourse) {
    String id = cacheCourse.courseID;

    final random = Random();
    int prefColor = random.nextInt(8);
    bool visibility = true;
    return Course(
      id: id,
      prefColor: prefColor,
      prefVisibility: visibility,
      courseID: cacheCourse.courseID,
      courseTitle: cacheCourse.courseTitle,
      courseTitleJP: cacheCourse.courseTitleJP,
      courseInstructor: cacheCourse.courseInstructor,
      courseInstructorJP: cacheCourse.courseInstructorJP,
      courseLanguage: cacheCourse.courseLanguage,
      courseType: cacheCourse.courseType,
      courseTerm: cacheCourse.courseTerm,
      courseOccurrences: cacheCourse.courseOccurrences,
      courseMinYear: cacheCourse.courseMinYear,
      courseCategory: cacheCourse.courseCategory,
      courseCredit: cacheCourse.courseCredit,
      courseLevel: cacheCourse.courseLevel,
      courseEvaluation: cacheCourse.courseEvaluation,
      courseCode: cacheCourse.courseCode,
      courseSubtitle: cacheCourse.courseSubtitle,
      courseCategoryName: cacheCourse.courseCategoryName,
      courseModality:
          cacheCourse.courseModality.toString(), // Convert int to String
      courseSchool: cacheCourse.courseSchool,
    );
  }

  final Map<int, String> dayMap = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday',
  };

  final List cellColors = [
    const Color(0xFFCFFAFE),
    const Color(0xFFFFEDD5),
    const Color(0xFFFFE4E6),
    const Color(0xFFFEF3C7),
    const Color(0xFFECFCCB),
    const Color(0xFFF3E8FF),
    const Color(0xFFCCFBF1),
    const Color.fromARGB(255, 255, 228, 250)
  ];

  final List textColors = [
    const Color.fromARGB(255, 62, 169, 179),
    const Color.fromARGB(255, 227, 160, 73),
    const Color.fromARGB(255, 212, 66, 76),
    const Color.fromARGB(255, 213, 187, 86),
    const Color.fromARGB(255, 147, 187, 68),
    const Color.fromARGB(255, 185, 121, 254),
    const Color.fromARGB(255, 51, 203, 170),
    const Color.fromARGB(255, 235, 89, 208)
  ];
}
