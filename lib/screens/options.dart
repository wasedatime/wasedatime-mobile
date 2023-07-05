import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: null,
      body: Center(
        child: Text('Welcome to the Options Screen'),
      ),
    );
  }
}
