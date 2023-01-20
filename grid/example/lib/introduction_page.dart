import 'package:example/what_is_a_design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.design_services_rounded),
                text: 'What is a design grid?',
              ),
            ],
          ),
          title: const Text('Design Grid'),
        ),
        body: const TabBarView(
          children: [
            WhatIsADesignGrid(),
          ],
        ),
      ),
    );
  }
}
