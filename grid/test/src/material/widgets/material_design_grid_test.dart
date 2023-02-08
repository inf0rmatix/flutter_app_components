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
                constraints: const BoxConstraints(maxWidth: 599),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 904),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 1239),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
              GoldenTestScenario(
                name: 'medium (laptop)',
                constraints: const BoxConstraints(maxWidth: 1439),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
              GoldenTestScenario(
                name: 'large (desktop)',
                constraints: const BoxConstraints(maxWidth: 1600),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
            ],
          ),
        ),
      );

      goldenTest(
        'should layout correctly for half-empty rows',
        fileName: 'material_design_grid_half_empty_rows',
        builder: () => MaterialDesignGridTheme(
          child: Column(
            children: [
              GoldenTestScenario(
                name: 'extra small (phone)',
                constraints: const BoxConstraints(maxWidth: 599),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 904),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 1239),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
              GoldenTestScenario(
                name: 'medium (laptop)',
                constraints: const BoxConstraints(maxWidth: 1439),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
              GoldenTestScenario(
                name: 'large (desktop)',
                constraints: const BoxConstraints(maxWidth: 1600),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _MaterialDesignGridForHalfEmptyRowTest extends StatelessWidget {
  const _MaterialDesignGridForHalfEmptyRowTest();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
      child: const MaterialDesignGrid(
        children: [
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 4,
                child: _GridChildLabel(columns: 4),
              ),
            ],
          ),
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 3,
                child: _GridChildLabel(columns: 3),
              ),
            ],
          ),
          MaterialDesignGridRow(
            children: [
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
            ],
          ),
        ],
      ),
    );
  }
}

class _MaterialDesignGridForGeneralTest extends StatelessWidget {
  const _MaterialDesignGridForGeneralTest();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
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
