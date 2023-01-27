import 'package:design_grid/design_grid.dart';
import 'package:example/nested_design_grid/example_form.dart';
import 'package:flutter/material.dart';

class NestingDesignGrids extends StatelessWidget {
  const NestingDesignGrids({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignGrid(
      children: [
        DesignGridChild(
          smallColumns: 12,
          child: Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Nesting design grids is supported',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        DesignGridChild(
          smallColumns: 12,
          child: ExampleForm(),
        ),
      ],
    );
  }
}
