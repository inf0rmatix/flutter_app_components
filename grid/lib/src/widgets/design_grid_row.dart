import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_column_sizes.dart';
import 'package:flutter/widgets.dart';

class DesignGridRow extends StatelessWidget {
  /// The horizontal alignment of the [DesignGridItem]s.
  final DesignGridAlignment alignment;

  final List<DesignGridItem> children;

  const DesignGridRow({
    super.key,
    this.alignment = DesignGridAlignment.start,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    final displaySize = DesignGridDisplaySizeConfig.of(context);

    final columnSizes = DesignGridColumnSizes.of(context);

    final sizedChildren = <Widget>[];

    var columnCounter = 0;

    for (final child in children) {
      final isChildBreak = child is DesignGridItemBreak;

      // ignore the break if we are at the start of the row
      if (columnCounter == 0 && isChildBreak) {
        continue;
      }

      final columns = isChildBreak ? theme.columns - columnCounter : child.columns.getColumns(displaySize);

      // ignore the break if the row is already full
      if (isChildBreak && columns >= theme.columns) {
        continue;
      }

      if (columns <= 0) {
        continue;
      }

      if (columnCounter + columns > theme.columns) {
        columnCounter = 0;
      }

      final columnSize =
          columnSizes.sublist(columnCounter, columns + columnCounter).reduce((value, element) => value + element);

      final spannedSpacers = columns - 1;

      final spannedSpacersSize = spannedSpacers * theme.columnSpacing;

      final childSize = columnSize + spannedSpacersSize;

      columnCounter += columns;

      final childWidget = KeyedSubtree.wrap(
        DesignGridChildData(
          columns: columns,
          width: childSize,
          child: child,
        ),
        children.indexOf(child),
      );

      sizedChildren.add(childWidget);
    }

    return Wrap(
      alignment: alignment.toWrapAlignment(),
      spacing: theme.columnSpacing,
      runSpacing: theme.rowSpacing,
      children: sizedChildren,
    );
  }
}
