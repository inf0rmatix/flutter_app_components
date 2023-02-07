import 'package:alchemist/alchemist.dart';
import 'package:design_grid/src/design_grid_column_sizes.dart';
import 'package:design_grid/src/material/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Material Design Grid',
    () {
      goldenTest(
        'should work on all breakpoints',
        fileName: 'material_design_grid_breakpoints',
        builder: () => MaterialDesignGridTheme(
          child: Column(
            children: [
              GoldenTestScenario(
                name: 'extra small (phone)',
                child: const _MaterialDesignGridForTest(width: 599),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                child: const _MaterialDesignGridForTest(width: 904),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                child: const _MaterialDesignGridForTest(width: 1239),
              ),
              GoldenTestScenario(
                name: 'medium (laptop)',
                child: const _MaterialDesignGridForTest(width: 1439),
              ),
              GoldenTestScenario(
                name: 'large (desktop)',
                child: const _MaterialDesignGridForTest(width: 1600),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _MaterialDesignGridForTest extends StatelessWidget {
  final double width;

  const _MaterialDesignGridForTest({required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: const MaterialDesignGrid(
        children: [
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 4,
                child: _GridChildLabel(columns: 4),
              ),
              MaterialDesignGridItem(
                columns: 4,
                child: _GridChildLabel(columns: 4),
              ),
              MaterialDesignGridItem(
                columns: 4,
                child: _GridChildLabel(columns: 4),
              ),
            ],
          ),
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
            ],
          ),
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GridChildLabel extends StatelessWidget {
  final int columns;

  const _GridChildLabel({
    required this.columns,
  });

  @override
  Widget build(BuildContext context) {
    final totalColumns = DesignGridColumnSizes.of(context).length;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          '$columns / $totalColumns',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
