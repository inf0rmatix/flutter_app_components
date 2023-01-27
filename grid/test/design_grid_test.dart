import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid', () {
    test('should calculate column width accurately so that all columns summarized don\'t overflow', () {
      const theme = DesignGridThemeData();

      for (double size = 100; size < 2000; size++) {
        final width = size;

        final columnSizes = DesignGrid.calculateColumnSizes(width, theme);

        final totalColumnWidth = columnSizes.reduce((value, element) => value += element);

        final totalWidth = totalColumnWidth + (theme.columns - 1) * theme.columnSpacing;

        expect(totalWidth, width);
      }
    });
  });
}

// TODO golden test for width of 1540px width 12 columns and 16 column spacing