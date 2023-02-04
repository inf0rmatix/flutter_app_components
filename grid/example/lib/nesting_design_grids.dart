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
      child: DesignGrid(
        children: [
          DesignGridChild(
            columns: const DesignGridChildColumns(
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
          DesignGridChild(
            columns: const DesignGridChildColumns(
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
                  DesignGridDebugOverlay(
                    isInBackground: true,
                    shouldCalculateLayout: true,
                    child: ExampleForm(
                      gridConstraintsChanged: true,
                      useOuterPadding: true,
                    ),
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
