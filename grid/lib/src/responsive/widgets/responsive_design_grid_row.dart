import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_column_sizes.dart';
import 'package:flutter/widgets.dart';

class ResponsiveDesignGridRow extends StatelessWidget {
  /// The horizontal alignment of the [ResponsiveDesignGridItem]s.
  final DesignGridRowAlignment alignment;

  final List<ResponsiveDesignGridItem> children;

  const ResponsiveDesignGridRow({
    super.key,
    this.alignment = DesignGridRowAlignment.start,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ResponsiveDesignGridTheme.maybeOf(context) ?? const ResponsiveDesignGridThemeData();

    final displaySize = ResponsiveDesignGridDisplaySizeConfig.of(context);

    final columnSizes = DesignGridColumnSizes.of(context);

    final sizedChildren = <Widget>[];

    var columnCounter = 0;

    for (final child in children) {
      final isChildBreak = child is ResponsiveDesignGridItemBreak;

      // ignore the break if we are at the start of the row
      if (columnCounter == 0 && isChildBreak) {
        continue;
      }

      final columns = isChildBreak ? theme.columns - columnCounter : child.columns.getColumns(displaySize);

      // ignore the break if the row is already full
      // TODO move up and check if necessary
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
        ResponsiveDesignGridItemData(
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
