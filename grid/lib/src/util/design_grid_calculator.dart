import 'package:design_grid/design_grid.dart';

class DesignGridCalculator {
  static List<double> calculateColumnSizes(double width, DesignGridThemeData theme) {
    final columns = theme.columns;

    final spacers = columns - 1;

    final totalSpacingWidth = spacers * theme.columnSpacing;

    final columnSpace = width - totalSpacingWidth;

    var columnRest = columnSpace % columns;

    final evenlyDividableColumnSpace = columnSpace - columnRest;

    final columnWidth = evenlyDividableColumnSpace / columns;

    final columnSizes = List.generate(columns, (_) => columnWidth);

    for (var column = 0; column < columns; column++) {
      if (columnRest >= 1) {
        columnSizes[column] += 1;
        columnRest--;
      } else {
        columnSizes[column] += columnRest;
        columnRest = 0;
        break;
      }
    }

    return columnSizes;
  }
}
