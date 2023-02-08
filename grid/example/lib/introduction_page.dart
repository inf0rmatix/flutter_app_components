import 'package:example/material_design_grid_example.dart';
import 'package:example/nesting_design_grids.dart';
import 'package:example/responsive_example.dart';
import 'package:example/what_is_a_design_grid.dart';
import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.design_services_rounded),
                text: 'What is a design grid?',
              ),
              Tab(
                icon: Icon(Icons.grid_on_rounded),
                text: 'Material Design Grid',
              ),
              Tab(
                icon: Icon(Icons.grid_3x3_rounded),
                text: 'Nesting Design Grids',
              ),
              Tab(
                icon: Icon(Icons.grid_view_rounded),
                text: 'Responsive Example',
              ),
            ],
          ),
          title: const Text('Design Grid'),
        ),
        body: const TabBarView(
          children: [
            WhatIsADesignGrid(),
            MaterialDesignGridExample(),
            NestingDesignGrids(),
            ResponsiveExample(),
          ],
        ),
      ),
    );
  }
}
