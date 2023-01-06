import 'package:flutter/material.dart';
import 'package:grid/grid.dart';

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
        useMaterial3: true,
      ),
      home: const ExamplePage(),
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
      body: Grid(
        children: [
          GridChild(
            smallColumns: 12,
            child: Container(
              color: Colors.teal.shade300,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 12 columns wide'),
              ),
            ),
          ),
          GridChild(
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
          GridChild(
            smallColumns: 10,
            child: Container(
              color: Colors.teal.shade500,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 10 columns wide'),
              ),
            ),
          ),
          GridChild(
            smallColumns: 4,
            child: Container(
              color: Colors.teal.shade300,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 4 columns wide'),
              ),
            ),
          ),
          GridChild(
            smallColumns: 4,
            child: Container(
              color: Colors.teal.shade300,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 4 columns wide'),
              ),
            ),
          ),
          GridChild(
            smallColumns: 4,
            child: Container(
              color: Colors.teal.shade300,
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Text('I am 4 columns wide'),
              ),
            ),
          ),
          GridChild(
            smallColumns: 8,
            child: Grid(
              gridPadding: 0,
              children: [
                GridChild(
                  smallColumns: 12,
                  child: Container(
                    color: Colors.blue.shade500,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text('This is a nested grid. I am 12 columns wide'),
                    ),
                  ),
                ),
                GridChild(
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
                GridChild(
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
                GridChild(
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
                GridChild(
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
                GridChild(
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
