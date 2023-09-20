import 'package:flutter/material.dart';
import 'package:wasedatime/widgets/syllabus/syllabusfilters/schoolsfilters/school_filter.dart';

final Map<String, List> schools = {
  'undergraduate': [
    'sils',
    'pse',
    'ase',
    'fse',
    'cse',
    'edu',
    'law',
    'hss',
    'sss',
    'sps',
    'cms',
    'soc',
    'hum',
  ],
  'graduate': [
    'g_sc',
    'g_sps',
    'g_fse',
    'g_e',
    'g_sa',
    'g_seee',
    'g_saps',
    'g_wbs',
    'g_ips',
    'g_ase',
    'g_hum',
    'g_cse',
    'g_siccs',
    'g_wls',
    'g_law',
    'g_las',
    'g_edu',
    'g_its',
    'g_ps',
    'g_sss',
    'g_sjal'
  ],
  'special': ['cjl', 'gec', 'cie', 'art']
};

class SchoolsDialogBox {
  static void showSchoolsDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Dialog(
          child: SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.3, // Set a fixed height
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.red[900],
                    tabs: const [
                      Tab(
                        text: "Undergraduate",
                      ),
                      Tab(
                        text: "Graduate",
                      ),
                      Tab(
                        text: "Special",
                      )
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Content for Tab 1
                        Center(
                            child: SchoolImageFilter(
                                school: 'undergraduate',
                                faculties: schools['undergraduate']!)),

                        // Content for Tab 2
                        Center(
                            child: SchoolImageFilter(
                                school: 'graduate',
                                faculties: schools['graduate']!)),

                        // Content for Tab 3
                        Center(
                            child: SchoolImageFilter(
                                school: 'special',
                                faculties: schools['special']!)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
