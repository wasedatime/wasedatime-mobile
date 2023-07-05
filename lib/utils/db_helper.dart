import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:wasedatime/models/course.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'wasedatime.db');

    // Delete the existing database file
    await deleteDatabase(path);

    print(path);

    ByteData jsonData = await rootBundle.load('assets/courses.json');
    String jsonString = utf8.decode(jsonData.buffer.asUint8List());
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    //print('$jsonMap');
    List<String> ids = jsonMap['addedCourses']['orderedIds'].cast<String>();

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS addedCourses (
          id TEXT PRIMARY KEY,
          prefColor INTEGER,
          prefVisibility INTEGER,
          prefDisplayLang TEXT,
          courseID TEXT,
          courseTitle TEXT,
          courseTitleJP TEXT,
          courseInstructor TEXT,
          courseInstructorJP TEXT,
          courseLanguage TEXT,
          courseType INTEGER,
          courseTerm TEXT,
          courseOccurrences TEXT,
          courseMinYear INTEGER,
          courseCategory TEXT,
          courseCredit INTEGER,
          courseLevel INTEGER,
          courseEvaluation TEXT,
          courseCode TEXT,
          courseSubtitle TEXT,
          courseCategoryName TEXT,
          courseModality TEXT,
          courseSchool TEXT
        )
      ''');

      await db.transaction((txn) async {
        await txn.rawDelete('DELETE FROM addedCourses'); // Empty the table

        for (String id in ids) {
          Map<String, dynamic> course =
              jsonMap['addedCourses']['byId'][id]['course'];

          await txn.insert('addedCourses', {
            'id': id,
            'prefColor': jsonMap['addedCourses']['byId'][id]['pref']['color'],
            'prefVisibility': jsonMap['addedCourses']['byId'][id]['pref']
                    ['visibility']
                ? 1
                : 0,
            'prefDisplayLang': jsonMap['addedCourses']['byId'][id]['pref']
                ['displayLang'],
            'courseID': course['a'],
            'courseTitle': course['b'],
            'courseTitleJP': course['c'],
            'courseInstructor': course['d'],
            'courseInstructorJP': course['e'],
            'courseLanguage': json.encode(course['f']),
            'courseType': course['g'],
            'courseTerm': course['h'],
            'courseOccurrences': json.encode(course['i']),
            'courseMinYear': course['j'],
            'courseCategory': course['k'],
            'courseCredit': course['l'],
            'courseLevel': course['m'],
            'courseEvaluation': json.encode(course['n']),
            'courseCode': course['o'],
            'courseSubtitle': course['p'],
            'courseCategoryName': course['q'],
            'courseModality': course['r'],
            'courseSchool': course['school'],
          });
        }
      });
    });

    return database;
  }

  Future<Map<int, Course>> getCoursesForDay(int day) async {
    final Database db = await initDatabase();
    final List<Map<String, dynamic>> courseDataList = await db.query(
      'addedCourses',
    );

    //print('courseDataList: $courseDataList');

    Map<int, Course> courses = {};

    // Create blank objects for all slots initially
    for (int i = 0; i < 7; i++) {
      courses[i] = Course();
    }

    for (Map<String, dynamic> courseData in courseDataList) {
      List<dynamic> occurrences = json.decode(courseData['courseOccurrences']);
      for (Map<String, dynamic> occurrence in occurrences) {
        //print('${occurrence['d']} == $day');
        if (occurrence['d'] == day) {
          int position =
              occurrence['p'] - 1; // Adjust position to 0-based index

          Course course = Course.fromDatabaseRecord(courseData);

          courses[position] = course;
        }
      }
    }
    print(day);
    // for (int i = 0; i < 7; i++) {
    //   print(courses[i]);
    // }
    return courses;
  }
}
