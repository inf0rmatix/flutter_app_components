import 'package:design_grid/design_grid.dart';
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
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: const DesignGridConfig(
        child: IntroductionPage(),
      ),
    );
  }
}
