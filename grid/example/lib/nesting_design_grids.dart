import 'package:design_grid/design_grid.dart';
import 'package:example/nested_design_grid/example_form.dart';
import 'package:flutter/material.dart';

class NestingDesignGrids extends StatefulWidget {
  const NestingDesignGrids({super.key});

  @override
  State<NestingDesignGrids> createState() => _NestingDesignGridsState();
}

class _NestingDesignGridsState extends State<NestingDesignGrids> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DesignGridDebugOverlay(
      child: ListView(
        children: [
          ResponsiveDesignGrid(
            children: [
              DesignGridRow(
                children: [
                  DesignGridItem(
                    columns: const DesignGridColumns(
                      small: 12,
                    ),
                    child: Container(
                      color: theme.colorScheme.primaryContainer,
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'Nesting design grids is supported',
                          style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  DesignGridItem(
                    columns: const DesignGridColumns(small: 0, medium: 12),
                    child: Container(
                      height: 50,
                      color: Colors.amber,
                    ),
                  ),
                  DesignGridItem(
                    columns: const DesignGridColumns(
                      small: 12,
                      medium: 8,
                      extraLarge: 6,
                    ),
                    child: Card(
                      child: Column(
                        children: const [
                          ListTile(
                            title: Text('Registration'),
                          ),
                          ExampleForm(
                            gridConstraintsChanged: true,
                            useOuterPadding: true,
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
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
