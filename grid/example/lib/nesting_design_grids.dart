import 'package:design_grid/design_grid.dart';
import 'package:example/nested_design_grid/example_form.dart';
import 'package:flutter/material.dart';

class NestingDesignGrids extends StatelessWidget {
  const NestingDesignGrids({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DesignGridDebugOverlay(
      child: DesignGrid(
        children: [
          DesignGridChild(
            smallColumns: 12,
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
          DesignGridChild(
            smallColumns: 12,
            mediumColumns: 8,
            extraLargeColumns: 6,
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
    );
  }
}
