import 'package:flutter/material.dart';

class SchoolsDialogBox {
  static void showSchoolsDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("hi"),
          );
        });
  }
}
