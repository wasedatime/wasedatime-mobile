import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:wasedatime/models/cache_course.dart';

import '../utils/db_helper.dart';
import '../widgets/syllabus/course_card.dart';
import '../widgets/syllabus/filter_dialogbox.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({Key? key}) : super(key: key);

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  late Future<List<CacheCourse>> coursesSearch;
  List<CacheCourse> courses = [];
  String searchQuery = '';
  int offset = 0; //current page
  int limit = 100; //courses per page

  final ScrollController _scrollController = ScrollController();
  bool isPerformingRequest = false;

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    // Initialize connectivity subscription
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        safePrint("No internet connection.");
      } else {
        safePrint("Connected to $result");
      }
    });

    coursesSearch =
        DatabaseHelper.instance.getCachedCourses(offset: offset, limit: limit);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreCourses(searchQuery);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = MediaQuery.of(context).size;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: constraints.maxHeight * 0.065,
                  bottom: constraints.maxHeight * 0.02,
                ),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Syllabus',
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                height: size.height * 0.8,
                width: size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.75,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.045),
                          decoration: BoxDecoration(
                            border: null,
                            borderRadius:
                                BorderRadius.circular(size.width * 0.075),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 120, 119, 119)
                                    .withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              hintText: 'Search for a course',
                              hintStyle: TextStyle(color: Color(0xFF7B7D7D)),
                              border: InputBorder.none,
                              fillColor: Colors.white,
                            ),
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                              _searchCourses(searchQuery);
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.filter_alt),
                            color: const Color(0xFF7B7D7D),
                            onPressed: () {
                              // Add your filter functionality here
                              getCourses();
                              FilterDialogBox.showFilterDialogBox(context);
                            },
                            iconSize: size.height * 0.045,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: size.height * 0.01),
                    Expanded(
                      child: FutureBuilder<List<CacheCourse>>(
                        future: coursesSearch,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator(); // Loading indicator
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text('No courses available.');
                          }

                          courses = snapshot.data!;

                          return ListView.builder(
                            itemCount: courses.length + 1,
                            itemBuilder: (context, index) {
                              if (index == courses.length) {
                                if (isPerformingRequest) {
                                  return const CircularProgressIndicator();
                                }
                                return Container(); // Empty container for loading indicator
                              } else {
                                return CourseCard(course: courses[index]);
                              }
                            },
                            controller: _scrollController,
                            padding: EdgeInsets.fromLTRB(
                                0, size.height * 0.01, 0, 0),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  getCourses() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    safePrint(connectivityResult);

    if (connectivityResult == ConnectivityResult.none) {
      safePrint("Cannot call API because there's no internet connection.");
      return;
    }

    try {
      final restOperation = Amplify.API.get(
        '/syllabus/FSE', // Relative path to be added to the endpoint
        apiName: 'wasedatime-rest-api', // Replace with your REST API name
      );
      final response = await restOperation.response;
      final courseList = json.decode(response.decodeBody());
      DatabaseHelper.instance.cacheCourses(courseList, "FSE");
      safePrint('got courses');
    } on ApiException catch (e) {
      safePrint('GET call failed: $e');
      // **NOTE** Need to give visual cue that getting courses failed
    }
  }

  Future<List<CacheCourse>> _loadCourses(
      int offset, int limit, String query) async {
    final courses = await DatabaseHelper.instance
        .getCachedCourses(offset: offset, limit: limit, searchQuery: query);
    return courses;
  }

  Future<void> _loadMoreCourses(String query) async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      final newCourses = await _loadCourses(offset + limit, limit, query);
      setState(() {
        courses.addAll(newCourses);
        offset += limit;
        isPerformingRequest = false; // Set it back to false after loading
      });
    }
  }

  Future<void> _searchCourses(String query) async {
    setState(() {
      courses = []; // Clear the existing courses
      offset = 0; // Reset the offset
      searchQuery = query; // Update the searchQuery
      coursesSearch =
          _loadCourses(offset, limit, searchQuery); // Update coursesSearch
    });
    await _loadMoreCourses(searchQuery);
  }
}
