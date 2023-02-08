import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_column_sizes.dart';
import 'package:flutter/widgets.dart';

class MaterialDesignGridRow extends StatelessWidget {
  /// The horizontal alignment of the [ResponsiveDesignGridItem]s.
  final DesignGridRowAlignment alignment;

  final List<MaterialDesignGridItem> children;

  const MaterialDesignGridRow({
    super.key,
    this.alignment = DesignGridRowAlignment.start,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MaterialDesignGridTheme.maybeOf(context) ?? const MaterialDesignGridThemeData();

    final columnSizes = DesignGridColumnSizes.of(context);

    final columns = columnSizes.length;

    final sizedChildren = <Widget>[];

    var columnCounter = 0;

    for (final child in children) {
      final isChildBreak = child is ResponsiveDesignGridItemBreak;

      // ignore the break if we are at the start of the row
      if (columnCounter == 0 && isChildBreak) {
        continue;
      }

      final childColumns = isChildBreak ? columns - columnCounter : child.columns;

      // ignore the break if the row is already full
      // TODO move up and check if necessary
      if (isChildBreak && childColumns >= columns) {
        continue;
      }

      if (childColumns <= 0) {
        continue;
      }

      if (columnCounter + childColumns > columns) {
        columnCounter = 0;
      }

      final columnSize =
          columnSizes.sublist(columnCounter, childColumns + columnCounter).reduce((value, element) => value + element);

      final spannedSpacers = childColumns - 1;

      final spannedSpacersSize = spannedSpacers * theme.columnSpacing;

      final childSize = columnSize + spannedSpacersSize;

      columnCounter += childColumns;

      final childWidget = KeyedSubtree.wrap(
        MaterialDesignGridItemData(
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
