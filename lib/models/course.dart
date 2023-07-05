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
}
