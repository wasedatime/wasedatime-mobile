import 'package:flutter/material.dart';
import 'package:wasedatime/screens/daily.dart';
import 'package:wasedatime/screens/syllabus.dart';
import 'package:wasedatime/screens/options.dart';
import 'package:wasedatime/screens/weeklytable.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List<Widget> _screens = [
    const SyllabusScreen(),
    const WeeklyTable(),
    const OptionsScreen(),
    const DailyScreen(),
  ];

  int currentIndex = 3;
  bool week = false;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final iconSize = size.width * 0.13;
    final largeiconSize = size.width * 0.16;

    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          _screens[currentIndex],
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.11,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    child: CustomPaint(
                      size: Size(size.width, size.height),
                      painter: BNBCustomPainter(),
                    ),
                  ),
                  Center(
                    heightFactor: 0.5,
                    child: SizedBox(
                      width: iconSize * 3,
                      height: iconSize * 3,
                      child: FloatingActionButton(
                        backgroundColor: currentIndex == 1 || currentIndex == 3
                            ? const Color(0xFFBF2D42)
                            : Colors.white,
                        elevation: 0.1,
                        onPressed: () {
                          if (week && currentIndex == 1) {
                            week = false;
                            setBottomBarIndex(3);
                          } else if (!week && currentIndex == 3) {
                            week = true;
                            setBottomBarIndex(1);
                          } else if (currentIndex != 1 && currentIndex != 3) {
                            if (week) {
                              setBottomBarIndex(1);
                            } else {
                              setBottomBarIndex(3);
                            }
                          }
                        },
                        child: Icon(
                          currentIndex == 3 || !week
                              ? Icons.calendar_view_day_rounded
                              : Icons.calendar_month,
                          color: currentIndex == 1 || currentIndex == 3
                              ? Colors.white
                              : const Color(0xFF2C2C2C),
                          size: largeiconSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        IconButton(
                          iconSize: iconSize,
                          icon: Icon(
                            Icons.class_,
                            color: currentIndex == 0
                                ? const Color(0xFFBF2D42)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          splashColor: Colors.white,
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            iconSize: iconSize,
                            icon: Icon(
                              Icons.menu_rounded,
                              color: currentIndex == 2
                                  ? const Color(0xFFBF2D42)
                                  : Colors.white,
                            ),
                            onPressed: () {
                              setBottomBarIndex(2);
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF2C2C2C)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
