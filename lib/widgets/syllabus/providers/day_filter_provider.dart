import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Day { monday, tuesday, wednesday, thursday, friday, saturday }

class DaysFilterNotifier extends StateNotifier<Map<Day, bool>> {
  DaysFilterNotifier()
      : super({
          Day.monday: false,
          Day.tuesday: false,
          Day.wednesday: false,
          Day.thursday: false,
          Day.friday: false,
          Day.saturday: false,
        });

  void updateDay(Day day, bool newValue) {
    state = {...state, day: !newValue};
    safePrint(state);
  }
}

final daysFilterNotifier =
    StateNotifierProvider<DaysFilterNotifier, Map<Day, bool>>(
        (ref) => DaysFilterNotifier());
