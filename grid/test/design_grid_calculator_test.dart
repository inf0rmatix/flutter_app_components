import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid Calculator', () {
    test('should calculate column width accurately so that all columns summarized don\'t overflow', () {
      const theme = DesignGridThemeData();

      const testSizes = <double>[768, 1024, 1280, 1366, 1440, 1600, 1920, 2560, 3840, 1250.64234127];

      for (final size in testSizes) {
        final width = size;

        final columnSizes = DesignGridCalculator.calculateColumnSizes(width, theme);

        final totalColumnWidth = columnSizes.reduce((value, element) => value += element);

        final totalWidth = totalColumnWidth + (theme.columns - 1) * theme.columnSpacing;

        expect(totalWidth, width);
      }
    });
  });
}
