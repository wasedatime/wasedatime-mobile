import 'package:flutter/material.dart';

class ClassTimes {
  static late List<String> currentTerm;

  static List<DateTimeRange> getClassTimes(DateTime now) {
    return [
      DateTimeRange(
        start: DateTime(now.year, now.month, now.day, 8, 50),
        end: DateTime(now.year, now.month, now.day, 10, 30),
      ),
      DateTimeRange(
        start: DateTime(now.year, now.month, now.day, 10, 40),
        end: DateTime(now.year, now.month, now.day, 12, 20),
      ),
      DateTimeRange(
        start: DateTime(now.year, now.month, now.day, 13, 10),
        end: DateTime(now.year, now.month, now.day, 14, 50),
      ),
      DateTimeRange(
        start: DateTime(now.year, now.month, now.day, 15, 5),
        end: DateTime(now.year, now.month, now.day, 16, 45),
      ),
      DateTimeRange(
        start: DateTime(now.year, now.month, now.day, 17, 0),
        end: DateTime(now.year, now.month, now.day, 18, 40),
      ),
      DateTimeRange(
        start: DateTime(now.year, now.month, now.day, 18, 55),
        end: DateTime(now.year, now.month, now.day, 20, 35),
      ),
      DateTimeRange(
        start: DateTime(now.year, now.month, now.day, 20, 45),
        end: DateTime(now.year, now.month, now.day, 21, 35),
      ),
    ];
  }

  static void initializeCurrentTerm(DateTime now) {
    currentTerm = getTerm(now);
  }

  static List<String> getTerm(DateTime now) {
    List<String> terms = [];
    if (now.isAfter(springSemester(now).start) &&
        now.isBefore(springSemester(now).end)) {
      terms.add('0s');
    } else if (now.isAfter(fallSemester(now).start) &&
        now.isBefore(fallSemester(now).end)) {
      terms.add('2s');
    }
    if (now.isAfter(springQuarter(now).start) &&
        now.isBefore(springQuarter(now).end)) {
      terms.add('0q');
    } else if (now.isAfter(summerQuarter(now).start) &&
        now.isBefore(summerQuarter(now).end)) {
      terms.add('1q');
    } else if (now.isAfter(fallQuarter(now).start) &&
        now.isBefore(fallQuarter(now).end)) {
      terms.add('2q');
    } else if (now.isAfter(winterQuarter(now).start) &&
        now.isBefore(winterQuarter(now).end)) {
      terms.add('3q');
    }
    return terms;
  }

  static DateTimeRange springSemester(DateTime now) {
    return DateTimeRange(
      start: DateTime(now.year, 2, 20),
      end: DateTime(now.year, 8, 10),
    );
  }

  static DateTimeRange fallSemester(DateTime now) {
    return DateTimeRange(
      start: DateTime(now.year, 8, 11),
      end: DateTime(now.year + 1, 2, 19),
    );
  }

  static DateTimeRange springQuarter(DateTime now) {
    return DateTimeRange(
      start: DateTime(now.year, 2, 20),
      end: DateTime(now.year, 6, 3),
    );
  }

  static DateTimeRange summerQuarter(DateTime now) {
    return DateTimeRange(
      start: DateTime(now.year, 6, 4),
      end: DateTime(now.year, 8, 10),
    );
  }

  static DateTimeRange fallQuarter(DateTime now) {
    return DateTimeRange(
      start: DateTime(now.year, 8, 11),
      end: DateTime(now.year, 11, 25),
    );
  }

  static DateTimeRange winterQuarter(DateTime now) {
    return DateTimeRange(
      start: DateTime(now.year, 11, 26),
      end: DateTime(now.year + 1, 2, 19),
    );
  }
}
