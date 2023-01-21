import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.teal,
        backgroundColor: Colors.grey.shade900,
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      // home: const IntroductionPage(),
      home: const PageWithNestedGrids(),
    );
  }
}

class PageWithNestedGrids extends StatelessWidget {
  const PageWithNestedGrids({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DesignGrid(
        children: [
          DesignGridChild(
            smallColumns: 6,
            child: MyWidgetWithADesignGrid(),
          ),
          DesignGridChild(
            smallColumns: 6,
            child: MyWidgetWithADesignGrid(),
          ),
        ],
      ),
    );
  }
}

class MyWidgetWithADesignGrid extends StatelessWidget {
  const MyWidgetWithADesignGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignGrid(
      children: [
        DesignGridChild(
          smallColumns: 6,
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text('This is a nested design grid'),
            ),
          ),
        ),
        DesignGridChild(
          smallColumns: 6,
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text('Nesting design grids is supported'),
            ),
          ),
        ),
        DesignGridChild(
          smallColumns: 12,
          largeColumns: 6,
          child: DesignGrid(
            children: [
              // TODO maybe introduce row concept to make this easier to read when there are many children and spacers are used
              DesignGridChild(
                smallColumns: 6,
                mediumColumns: 5,
                child: Container(
                  height: 32,
                  color: Colors.teal,
                ),
              ),
              DesignGridChild(
                smallColumns: 0,
                mediumColumns: 1,
                child: Container(
                  height: 32,
                  color: Colors.orange,
                ),
              ),
              DesignGridChild(
                smallColumns: 6,
                child: Container(
                  height: 32,
                  color: Colors.teal,
                ),
              ),
              DesignGridChild(
                smallColumns: 6,
                child: Container(
                  height: 32,
                  color: Colors.teal,
                ),
              ),
              DesignGridChild(
                smallColumns: 6,
                child: Container(
                  height: 32,
                  color: Colors.teal,
                ),
              ),
              DesignGridChild(
                smallColumns: 6,
                child: Container(
                  height: 32,
                  color: Colors.teal,
                ),
              ),
              DesignGridChild(
                smallColumns: 6,
                child: Container(
                  height: 32,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade500,
      appBar: AppBar(
        title: const Text('Grid Demo'),
      ),
      body: DesignGrid(
        children: [
          DesignGridChild(
            smallColumns: 12,
            child: Container(
              color: Colors.teal.shade300,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 12 columns wide'),
              ),
            ),
          ),
          DesignGridChild(
            smallColumns: 2,
            child: Container(
              color: Colors.teal.shade500,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text(
                  'I am 2 columns wide',
                  softWrap: false,
                ),
              ),
            ),
          ),
          DesignGridChild(
            smallColumns: 10,
            child: Container(
              color: Colors.teal.shade500,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 10 columns wide'),
              ),
            ),
          ),
          DesignGridChild(
            smallColumns: 4,
            child: Container(
              color: Colors.teal.shade300,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 4 columns wide'),
              ),
            ),
          ),
          DesignGridChild(
            smallColumns: 4,
            child: Container(
              color: Colors.teal.shade300,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 4 columns wide'),
              ),
            ),
          ),
          DesignGridChild(
            smallColumns: 4,
            child: Container(
              color: Colors.teal.shade300,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 4 columns wide'),
              ),
            ),
          ),
          DesignGridChild(
            smallColumns: 8,
            child: DesignGrid(
              gridPadding: 0,
              children: [
                DesignGridChild(
                  smallColumns: 12,
                  child: Container(
                    color: Colors.blue.shade500,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text('This is a nested grid. I am 12 columns wide'),
                    ),
                  ),
                ),
                DesignGridChild(
                  smallColumns: 3,
                  child: Container(
                    color: Colors.blue.shade500,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'I am 3 columns wide',
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                DesignGridChild(
                  smallColumns: 3,
                  child: Container(
                    color: Colors.blue.shade500,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'I am 3 columns wide',
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                DesignGridChild(
                  smallColumns: 3,
                  child: Container(
                    color: Colors.blue.shade500,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'I am 3 columns wide',
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                DesignGridChild(
                  smallColumns: 3,
                  child: Container(
                    color: Colors.blue.shade500,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'I am 3 columns wide',
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                DesignGridChild(
                  smallColumns: 13,
                  child: Container(
                    color: Colors.blue.shade500,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'I try to span more columns than are available. I am 13 columns wide',
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
