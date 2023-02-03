import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid Calculator', () {
    test('should calculate column width accurately so that all columns summarized don\'t overflow', () {
      const theme = DesignGridThemeData();

      for (double size = 100; size < 2000; size++) {
        final width = size;

        final columnSizes = DesignGridCalculator.calculateColumnSizes(width, theme);

        final totalColumnWidth = columnSizes.reduce((value, element) => value += element);

        final totalWidth = totalColumnWidth + (theme.columns - 1) * theme.columnSpacing;

        expect(totalWidth, width);
      }
    });
  });
}
