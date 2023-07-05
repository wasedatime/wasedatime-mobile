import 'package:flutter/material.dart';

class ClassTimes {
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
}
