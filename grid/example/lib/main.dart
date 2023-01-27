import 'package:flutter/material.dart';

import 'introduction_page.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        backgroundColor: Colors.grey.shade900,
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const IntroductionPage(),
      // home: const PageWithNestedGrids(),
    );
  }
}
