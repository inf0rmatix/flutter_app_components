import 'package:design_grid/design_grid.dart';
import 'package:design_grid/design_grid_child_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatIsADesignGrid extends StatelessWidget {
  const WhatIsADesignGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const columnSizeExamples = [12, 6, 4, 3, 2, 1];

    const description = '''
Every element in the grid is designated a number of columns. Now they can be reliably positioned and sized. This is especially useful for responsive design. 

For additional information, see the article linked below. 
Please note that this implementation differs from the Material Design specification in that it uses a fixed amount of 12 columns instead of a variable amount of columns. 
Responsiveness is achieved by using different column sizes for different screen sizes.''';

    return Stack(
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return DesignGrid(
            children: List.generate(
              DesignGridThemeData.defaultColumns,
              (_) => DesignGridChild(
                smallColumns: 1,
                child: Container(
                  width: double.infinity,
                  height: constraints.biggest.height,
                  color: Colors.teal.withAlpha(50),
                ),
              ),
            ),
          );
        }),
        Positioned.fill(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            children: [
              DesignGrid(
                alignment: DesignGridAlignment.center,
                children: [
                  DesignGridChild(
                    smallColumns: 12,
                    mediumColumns: 10,
                    largeColumns: 8,
                    extraLargeColumns: 6,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Column Design Grids divide the space into equally sized columns',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              description,
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 16.0),
                            TextButton.icon(
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                      'https://m2.material.io/design/layout/responsive-layout-grid.html#columns-gutters-and-margins'),
                                );
                              },
                              icon: const Icon(Icons.article_rounded),
                              label: const Text('Design Grids: A better way to build responsive layouts'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              DesignGrid(
                children: [
                  for (final columns in columnSizeExamples)
                    ...List.generate(
                      12 ~/ columns,
                      (_) => DesignGridChild(
                        smallColumns: columns,
                        child: _GridChildLabel(),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GridChildLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gridChildData = DesignGridChildData.of(context);
    final columns = gridChildData.columns;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          '$columns / 12',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
