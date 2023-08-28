import 'dart:convert';

class CacheCourse {
  String courseID;
  String courseTitle;
  String courseTitleJP;
  String courseInstructor;
  String courseInstructorJP;
  String courseLanguage;
  int courseType;
  String courseTerm;
  String courseOccurrences;
  int courseMinYear;
  String courseCategory;
  int courseCredit;
  int courseLevel;
  String courseEvaluation;
  String courseCode;
  String? courseSubtitle;
  String courseCategoryName;
  int courseModality;
  String courseSchool;

  CacheCourse({
    required this.courseID,
    required this.courseTitle,
    required this.courseTitleJP,
    required this.courseInstructor,
    required this.courseInstructorJP,
    required this.courseLanguage,
    required this.courseType,
    required this.courseTerm,
    required this.courseOccurrences,
    required this.courseMinYear,
    required this.courseCategory,
    required this.courseCredit,
    required this.courseLevel,
    required this.courseEvaluation,
    required this.courseCode,
    this.courseSubtitle,
    required this.courseCategoryName,
    required this.courseModality,
    required this.courseSchool,
  });

  Map<String, dynamic> toMap() {
    return {
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

  factory CacheCourse.fromMap(Map<String, dynamic> map, String school) {
    return CacheCourse(
      courseID: map['a'],
      courseTitle: map['b'],
      courseTitleJP: map['c'],
      courseInstructor: map['d'],
      courseInstructorJP: map['e'],
      courseLanguage: json.encode(map['f']),
      courseType: map['g'],
      courseTerm: map['h'],
      courseOccurrences: json.encode(map['i']),
      courseMinYear: map['j'],
      courseCategory: map['k'],
      courseCredit: map['l'],
      courseLevel: map['m'],
      courseEvaluation: json.encode(map['n']),
      courseCode: map['o'],
      courseSubtitle: map['p'],
      courseCategoryName: map['q'],
      courseModality: map['r'],
      courseSchool: school,
    );
  }

  factory CacheCourse.fromDatabaseRecord(Map<String, dynamic> record) {
    return CacheCourse(
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
    return 'courseID: $courseID, '
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

  final Map<int, String> dayMap = {
    1: 'Mon. ',
    2: 'Tue. ',
    3: 'Wed. ',
    4: 'Thur. ',
    5: 'Fri. ',
    6: 'Sat. ',
    7: 'Sun. ',
  };
}
