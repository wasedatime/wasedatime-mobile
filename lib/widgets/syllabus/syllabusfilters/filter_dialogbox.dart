import 'package:flutter/material.dart';

import 'package:wasedatime/widgets/syllabus/syllabusfilters/dropdownfilters/filter_dropdown.dart';
import 'package:wasedatime/widgets/syllabus/syllabusfilters/dropdownfilters/semester_dropdown.dart';
import 'package:wasedatime/widgets/syllabus/syllabusfilters/schoolsfilters/schools_dialogbox.dart';

import 'checkboxfilters/creditfilters/credit_filters_V2.dart';
import 'checkboxfilters/dayfilters/day_filters_v2.dart';
import 'checkboxfilters/eligyearfilters/eligible_year_V2.dart';
import 'checkboxfilters/periodfilters/period_filter_V2.dart';

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

    final Size size = MediaQuery.of(context).size;

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
                  // FilterDropdown(
                  //     label: "Select Semester",
                  //     options: semesters,
                  //     selectedValues: selectedSemesters),
                  SemesterDropdown(
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
                  FilterDropdown(
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
                  FilterDropdown(
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
                  // DayFilters(
                  //   selectedDays: _selectedDays,
                  // ),
                  const DayFiltersV2(),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Periods",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // PeriodFilters(selectedPeriods: _selectedPeriods),
                  const PeriodsFiltersV2(),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Eligible Year",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const EligibleYearFiltersV2(),
                  // EligibleYearFilters(
                  //     selectedEligibleYear: _selectedEligibleYear),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Credits",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // EligibleYearFilters(selectedEligibleYear: _selectedCredits),
                  const CreditFiltersV2()
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
