import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/course.dart';

class CourseCard extends StatelessWidget {
  // final Course course;
  // const CourseCard({required this.course, super.key});
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Name of Course",
                  style: TextStyle(
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Spacer(),
                const Image(
                    image: AssetImage('assets/images/SILS.png'),
                    fit: BoxFit.scaleDown,
                    height: 48,
                    width: 48),
                const Image(
                    image: AssetImage('assets/images/en-lang.png'),
                    fit: BoxFit.scaleDown,
                    height: 48,
                    width: 48)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Sat. 3"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            size: 25,
                            Icons.pin_drop_rounded,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("11-103"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.school_sharp,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Name of Professor(s)",
                            style: TextStyle(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.green,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 2,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(30)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    iconSize: 25,
                    icon: const Icon(
                      Icons.ios_share,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {},
                    iconSize: 23,
                    icon: const Icon(
                      Icons.chat_bubble,
                      color: Colors.amber,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}