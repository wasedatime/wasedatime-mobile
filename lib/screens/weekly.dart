import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class WeekScreen extends StatefulWidget {
  const WeekScreen({super.key});

  @override
  State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  @override
  Widget build(BuildContext context) {
    const String currentSemester = 'Spring';
    // const bool sixdays = false;
    const Map<int, List> timings = {
      1: ["8:50", "10:30"],
      2: ["10:40", "12:20"],
      3: ["13:10", "14:50"],
      4: ["15:05", "16:45"],
      5: ["17:00", "18:40"]
    };

    List mycolors = [
      Colors.amber[100],
      Colors.pink[50],
      Colors.pink[100],
      Colors.orange[50],
      Colors.orange[100],
      Colors.blue[50],
      Colors.blue[100],
      Colors.lightBlue[100],
      Colors.lightBlue[50],
      Colors.deepPurple[100],
      Colors.lightGreen[100],
      Colors.green[50],
    ];

    Color generateColor() {
      Random random = Random();
      int randomNumber = random.nextInt(7);
      return mycolors[randomNumber];
    }

    const List days = ["Mon", "Tue", "Wed", "Thu", "Fri"];
    final viewheight = MediaQuery.of(context).size.height;
    final viewwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xFFEFEFEF),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0.0,
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("<"),
              Spacer(),
              Text("$currentSemester Semester"),
              Spacer(),
              Text(">")
            ],
          ),
        ),
        body: SizedBox(
          height: viewheight * 0.88,
          // color: Colors.amber,
          child: Column(
            children: [
              Expanded(
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(40.0),
                    1: FlexColumnWidth(),
                    2: FlexColumnWidth(),
                    3: FlexColumnWidth(),
                    4: FlexColumnWidth(),
                    5: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: null,
                  children: <TableRow>[
                    TableRow(children: [
                      const TableCell(
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      for (int i = 0; i <= 4; i++)
                        TableCell(
                          child: Center(
                              child: Text(
                            days[i],
                            style: const TextStyle(fontSize: 20),
                          )),
                        ),
                    ]),
                    TableRow(children: [
                      // Spacer row between day and table
                      for (int j = 1; j <= 6; j++)
                        const TableCell(
                            child: Text(
                          "",
                          style: TextStyle(fontSize: 10),
                        ))
                    ]),
                    for (int period = 1; period <= 5; period++)
                      TableRow(
                        children: [
                          for (int day = 1; day <= 6; day++)
                            day != 1
                                ? TableCell(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      alignment: Alignment.center,
                                      height: viewheight * 0.14,
                                      decoration: BoxDecoration(
                                        color: generateColor(),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Day $day Period $period',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                : TableCell(
                                    child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.14,
                                    width: 50,
                                    child: Column(
                                      children: [
                                        Text(
                                          timings[period]?[0],
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const Spacer(),
                                        Text(
                                          timings[period]?[1],
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  )),
                        ],
                      ),
                  ],
                ),
              ),
              // Container(
              //   color: Colors.blue,
              //   child: SizedBox(
              //     height: MediaQuery.of(context).size.height * 0.11,
              //   ),
              // )
            ],
          ),
        ));
  }
}