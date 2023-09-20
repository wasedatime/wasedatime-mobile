import 'package:flutter/material.dart';
import 'package:wasedatime/widgets/syllabus/syllabusfilters/dropdownfilters/dropdown_filter.dart';
import 'package:wasedatime/widgets/syllabus/syllabusfilters/dropdownfilters/type_level_dropdown.dart';
import 'package:wasedatime/widgets/syllabus/syllabusfilters/dropdownfilters/evaluation_filter.dart';
import 'package:wasedatime/widgets/syllabus/syllabusfilters/schoolsfilters/schools_dialogbox.dart';

import 'checkboxfilters/creditfilters/credit_filters_v2.dart';
import 'checkboxfilters/dayfilters/day_filters_v2.dart';
import 'checkboxfilters/eligyearfilters/eligible_year_v2.dart';
import 'checkboxfilters/periodfilters/period_filter_v2.dart';

class FilterDialogBox {
  static void showFilterDialogBox(BuildContext context) {
    final List<String> semesters = [
      "Fall Semester",
      "Spring Semester",
      "Spring Quarter",
      "Summer Quarter",
      "Fall Quarter",
      "Winter Quarter",
    ];

    final List<String> languages = [
      "English",
      "Japanese",
      "German",
      "Chinese",
      "Russian",
      "Korean",
    ];

    final List<String> modalities = [
      "In person",
      "In person / Online",
      "Full On-demand",
      "Scheduled On-demand",
      "Realtime Streaming",
    ];

    List<String> selectedSemesters = [];
    List<String> selectedLanguages = [];
    List<String> selectedClassModalities = [];

    const List<String> types = [
      'Select Type',
      'Lecture',
      'Seminar',
      'Work',
      'Foreign Language',
      'On-demand',
      'Thesis',
      'Graduate Research',
      'Practice',
      'Blended'
    ];
    const List<String> levels = [
      'Select Level',
      'Beginner',
      'Intermediate',
      'Advanced',
      'Final-stage',
      'Master',
      'Doctor',
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return AlertDialog(
          title: const Text(
            'Filters',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          content: SizedBox(
            height: size.height * 0.4,
            width: size.width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red[900])),
                        onPressed: () {
                          SchoolsDialogBox.showSchoolsDialogBox(context);
                        },
                        child: const Text("Choose your schools")),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Semesters",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  DropdownFilterMulti(
                      label: "Select Semester",
                      options: semesters,
                      selectedValues: selectedSemesters),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Languages",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  DropdownFilterMulti(
                      label: "Select Languages",
                      options: languages,
                      selectedValues: selectedLanguages),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Class Modality",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  DropdownFilterMulti(
                      label: "Select Class Modality",
                      options: modalities,
                      selectedValues: selectedClassModalities),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Days",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const DayFiltersV2(),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Periods",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const PeriodsFiltersV2(),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Eligible Year",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const EligibleYearFiltersV2(),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Credits",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const CreditFiltersV2(),
                  const Text(
                    "Evaluation",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  EvaluationFilter(),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Type",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TypeAndLevelDropdown(
                    label: 'type',
                    listOptions: types,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Level",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TypeAndLevelDropdown(
                    label: 'level',
                    listOptions: levels,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.red[900]),
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop(
                    // send back information

                    );
              },
            )
          ],
        );
      },
    );
  }
}
