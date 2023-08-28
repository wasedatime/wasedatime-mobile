import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wasedatime/models/class_times.dart';

import 'package:wasedatime/models/course.dart';
import 'package:wasedatime/models/cache_course.dart';

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
    //await deleteDatabase(path);

    safePrint(path);

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
      await db.execute('''
        CREATE TABLE IF NOT EXISTS cachedCourses (
          courseID TEXT PRIMARY KEY,
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
          courseModality INTEGER,
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

  Future<Map<int, List<Course>>> getCoursesForDay(
    int day,
  ) async {
    final Database db = await initDatabase();
    final List<String> term = ClassTimes.currentTerm;
    final List<Map<String, dynamic>> courseDataList = await db.rawQuery(
      'SELECT * FROM addedCourses WHERE courseTerm = "${term[0]}" OR courseTerm = "${term[1]}" ORDER BY courseTitle',
    );

    Map<int, List<Course>> courses = {};

    // Create blank objects for all slots initially
    for (int i = 0; i < 7; i++) {
      courses[i] = [];
    }

    for (Map<String, dynamic> courseData in courseDataList) {
      List<dynamic> occurrences = json.decode(courseData['courseOccurrences']);
      for (Map<String, dynamic> occurrence in occurrences) {
        if (occurrence['d'] == day) {
          int position =
              occurrence['p'] - 1; // Adjust position to 0-based index

          Course course = Course.fromDatabaseRecord(courseData);

          courses[position]?.add(course);
        }
      }
    }
    safePrint(day);
    return courses;
  }

  Future<Map<int, Map<int, Course>>> getCoursesForWeek(
      List<String> term) async {
    final Database db = await initDatabase();
    final List<Map<String, dynamic>> courseDataList = await db.query(
      'addedCourses',
    );
    // print('courseDataList: $courseDataList');
    Map<int, Map<int, Course>> week = {};

    for (int prd = 1; prd <= 5; prd++) {
      Map<int, Course> eachDayForPeriod = {};
      for (int day = 2; day <= 6; day++) {
        eachDayForPeriod[day] = Course();
      }
      week[prd] = eachDayForPeriod;
    }

    for (Map<String, dynamic> courseData in courseDataList) {
      List<dynamic> occurrences = json.decode(courseData['courseOccurrences']);

      for (Map<String, dynamic> occurrence in occurrences) {
        // safePrint(occurrence);
        Course course = Course.fromDatabaseRecord(courseData);
        safePrint("${course.courseTitle}, ${course.courseTerm}");

        if (course.courseTerm == term[0] ||
            course.courseTerm == term[1] ||
            course.courseTerm == term[2]) {
          week[occurrence['p']]![occurrence['d'] + 1] = course;
        }
        if (course.courseTerm == term[0] ||
            course.courseTerm == term[1] ||
            course.courseTerm == term[2]) {
          week[occurrence['p']]![occurrence['d'] + 1] = course;
        }
      }
    }
    return week;
  }

  void cacheCourses(courseList, String school) async {
    final Database db = await initDatabase();

    for (final courseMap in courseList) {
      //safePrint(courseMap['i']);
      final course = CacheCourse.fromMap(courseMap, school);
      //safePrint(course.toString());
      await db.insert('cachedCourses', course.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<void> clearCache() async {
    final db = await initDatabase();

    // Drop the table if it exists
    await db.execute('DROP TABLE IF EXISTS cachedCourses');

    // Create the table with the desired schema
    await db.execute('''
        CREATE TABLE IF NOT EXISTS cachedCourses (
          courseID TEXT PRIMARY KEY,
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
          courseModality INTEGER,
          courseSchool TEXT
        )
      ''');
  }

  Future<List<CacheCourse>> getCachedCourses(
      {int? offset, int? limit, String? searchQuery}) async {
    final Database db = await initDatabase();

    // Define the query
    final String query = searchQuery != null && searchQuery.isNotEmpty
        ? "SELECT * FROM cachedCourses WHERE courseTitle LIKE '%$searchQuery%' LIMIT $limit OFFSET $offset"
        : "SELECT * FROM cachedCourses LIMIT $limit OFFSET $offset";

    final List<Map<String, dynamic>> courseDataList = await db.rawQuery(query);

    final List<CacheCourse> cachedCourses = courseDataList.map((courseData) {
      return CacheCourse.fromDatabaseRecord(courseData);
    }).toList();

    return cachedCourses;
  }

  Future<void> addCourse(Course course) async {
    final Database db = await DatabaseHelper.instance.database;

    await db.insert('addedCourses', course.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<bool> isCourseIdExists(String courseId) async {
    final db = await DatabaseHelper.instance.database;
    final count = Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM addedCourses WHERE courseID = ?',
          [courseId],
        )) ??
        0;
    return count > 0;
  }

  Future<void> removeCourse(String courseID) async {
    final db = await instance.database;
    await db.delete(
      'addedCourses',
      where: 'courseID = ?',
      whereArgs: [courseID],
    );
  }
}
