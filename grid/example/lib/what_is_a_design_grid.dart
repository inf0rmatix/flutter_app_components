import 'package:design_grid/design_grid.dart';
import 'package:example/grid_child_label.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatIsADesignGrid extends StatelessWidget {
  const WhatIsADesignGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const description = '''
Every element in the grid is designated a number of columns. Now they can be reliably positioned and sized. This is especially useful for responsive design. 

For additional information, see the article linked below. 
Please note that this implementation differs from the Material Design specification in that it uses a fixed amount of 12 columns instead of a variable amount of columns. 
Responsiveness is achieved by using different column sizes for different screen sizes.''';

    return DesignGridDebugOverlay(
      isInBackground: true,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          ResponsiveDesignGrid(
            alignment: DesignGridAlignment.center,
            children: [
              DesignGridRow(
                alignment: DesignGridRowAlignment.center,
                children: [
                  DesignGridItem(
                    columns: const DesignGridColumns(
                      small: 12,
                      medium: 10,
                      large: 8,
                      extraLarge: 6,
                    ),
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
            ],
          ),
          const SizedBox(height: 16.0),
          const ResponsiveDesignGrid(
            children: [
              DesignGridRow(
                children: [
                  // This will take all 12 columns
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 12,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These both take 6 columns each, together they take 12 columns
              DesignGridRow(
                children: [
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 6,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 6,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These all take 4 columns each, together they take 12 columns
              DesignGridRow(
                children: [
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 4,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 4,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 4,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These all take 3 columns each, together they take 12 columns
              DesignGridRow(
                children: [
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 3,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 3,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 3,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 3,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These all take 2 columns each, together they take 12 columns
              DesignGridRow(
                children: [
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These all take 1 column each, together they take 12 columns
              DesignGridRow(
                children: [
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: DesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
