import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid', () {
    test('should calculate column width accurately so that all columns summarized don\'t overflow', () {
      const sizes = <double>[100, 500, 1000, 2000];

      const theme = DesignGridThemeData(
        columns: 12,
        columnSpacing: 16,
      );

      for (final size in sizes) {
        final width = size;

        final columnWidth = DesignGrid.calculateColumnWidth(width, theme);

        final totalWidth = columnWidth * theme.columns + (theme.columns - 1) * theme.columnSpacing;

        final roundedWidth = ((totalWidth * 1000).roundToDouble()) / 1000;

        expect(roundedWidth, width);
      }
    });
  });
}
