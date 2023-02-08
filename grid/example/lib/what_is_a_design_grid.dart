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

For additional information, see the article linked below on the Material Design Grid.
This package provides two approaches, the Material one, with fixed columns for every item but changing amount of total columns and the Responsive one, where every item has different column spans for every breakpoint but the number of total columns stays the same.
''';

    return DesignGridDebugOverlay(
      isInBackground: true,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          ResponsiveDesignGrid(
            alignment: DesignGridAlignment.center,
            children: [
              ResponsiveDesignGridRow(
                alignment: DesignGridRowAlignment.center,
                children: [
                  DesignGridItem(
                    columns: const ResponsiveDesignGridColumns(
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
              ResponsiveDesignGridRow(
                children: [
                  // This will take all 12 columns
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 12,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These both take 6 columns each, together they take 12 columns
              ResponsiveDesignGridRow(
                children: [
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 6,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 6,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These all take 4 columns each, together they take 12 columns
              ResponsiveDesignGridRow(
                children: [
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 4,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 4,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 4,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These all take 3 columns each, together they take 12 columns
              ResponsiveDesignGridRow(
                children: [
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 3,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 3,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 3,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 3,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These all take 2 columns each, together they take 12 columns
              ResponsiveDesignGridRow(
                children: [
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 2,
                    ),
                    child: GridChildLabel(),
                  ),
                ],
              ),

              // These all take 1 column each, together they take 12 columns
              ResponsiveDesignGridRow(
                children: [
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 1,
                    ),
                    child: GridChildLabel(),
                  ),
                  DesignGridItem(
                    columns: ResponsiveDesignGridColumns(
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
