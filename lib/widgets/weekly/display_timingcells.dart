import 'package:flutter/material.dart';

class TimingCells extends StatelessWidget {
  final Map<int, List> timings;
  final int period;
  const TimingCells({super.key, required this.period, required this.timings});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TableCell(
        child: SizedBox(
      height: size.height * 0.14,
      width: size.width * 0.2,
      child: Column(
        children: [
          Text(
            timings[period]?[0],
            style: TextStyle(
                fontSize: size.width * 0.03,
                fontFamily: 'Inter',
                color: const Color.fromARGB(255, 127, 139, 156)),
          ),
          const Spacer(),
          Text(
            timings[period]?[1],
            style: TextStyle(
                fontSize: size.width * 0.03,
                fontFamily: 'Inter',
                color: const Color.fromARGB(255, 127, 139, 156)),
          )
        ],
      ),
    ));
  }
}
