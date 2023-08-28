import 'package:flutter/material.dart';

import 'package:wasedatime/widgets/syllabus/filter_dropdown.dart';

import '../../models/course.dart';

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

    Map<int, bool> selectedDays = {
      1: false,
      2: false,
      3: false,
      4: false,
      5: false,
      6: false,
    };

    Map<int, bool> selectedPeriods = {
      1: false,
      2: false,
      3: false,
      4: false,
      5: false,
      6: false,
    };

    Map<int, bool> selectedEligibleYear = {
      1: false,
      2: false,
      3: false,
      4: false,
    };

    Map<int, bool> selectedCredits = {
      1: false,
      2: false,
      3: false,
    };

    final Size size = MediaQuery.of(context).size;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return AlertDialog(
          title: const Text(
            'Filters',
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
                        onPressed: () {},
                        child: const Text("Choose your schools")),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Semesters"),
                  FilterDropdown(
                      label: "Select Semester",
                      options: semesters,
                      selectedValues: selectedSemesters),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Languages"),
                  FilterDropdown(
                      label: "Select Languages",
                      options: languages,
                      selectedValues: selectedLanguages),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Class Modality"),
                  FilterDropdown(
                      label: "Select Class Modality",
                      options: modalities,
                      selectedValues: selectedClassModalities),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Days"),
                  // Row(
                  //   children: [
                  //     for (MapEntry day in selectedDays.entries)
                  //       // FilterCheckBoxes(options: selectedDays, day: day)

                  //   ],
                  // ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Periods"),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Eligible Year"),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text("Credits"),
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
