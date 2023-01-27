import 'package:alchemist/alchemist.dart';
import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_child_data.dart';
import 'package:design_grid/src/display_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid', () {
    goldenTest(
      'should do a basic column layout for all sizes',
      fileName: 'design_grid_basic_column_layout',
      constraints: BoxConstraints(maxWidth: DisplaySize.extraLarge.maxWidth),
      builder: () {
        return Wrap(
          children: [
            for (final displaySize in DisplaySize.values)
              GoldenTestScenario(
                name: displaySize.name,
                constraints: BoxConstraints(maxWidth: displaySize.maxWidth),
                child: _DesignGridForTest(width: displaySize.maxWidth),
              ),
          ],
        );
      },
    );

    // TODO create test for nested design grids
    // TODO golden test for width of 1540px width 12 columns and 16 column spacing
  });
}

class _DesignGridForTest extends StatelessWidget {
  final double width;

  const _DesignGridForTest({
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    const columnSizeExamples = [12, 6, 4, 3, 2, 1];

    return MediaQuery(
      data: MediaQueryData(size: Size(DisplaySize.extraLarge.maxWidth, 1080)),
      child: DesignGrid(
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
