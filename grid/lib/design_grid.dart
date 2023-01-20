library grid;

import 'package:flutter/widgets.dart';

import 'design_grid_child.dart';
import 'design_grid_child_data.dart';
import 'design_grid_data.dart';
import 'display_size.dart';

export 'design_grid_child.dart';

class DesignGrid extends StatelessWidget {
  static const defaultColumns = 12;

  static const defaultGridPadding = 16.0;
  static const defaultColumnSpacing = 16.0;
  static const defaultRowSpacing = defaultColumnSpacing;

  /// The children of the grid.
  final List<DesignGridChild> children;

  /// The number of columns in the grid.
  final int columns;

  /// The padding on the left and right of the grid. Defaults to zero if inside another grid.
  final double gridPadding;

  /// The spacing between columns.
  final double columnSpacing;

  /// The spacing between rows.
  final double rowSpacing;

  const DesignGrid({
    super.key,
    this.columns = defaultColumns,
    required this.children,
    this.gridPadding = defaultGridPadding,
    this.columnSpacing = defaultColumnSpacing,
    this.rowSpacing = defaultRowSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final parentGridData = DesignGridData.maybeOf(context);

    final isNested = parentGridData != null;

    if (isNested) {
      final gridChildData = DesignGridChildData.of(context);

      final width = gridChildData.columns * parentGridData.columnWidth +
          (gridChildData.columns - 1) * parentGridData.columnSpacing;

      final columnWidth = _calculateColumnWidth(width);

      final displaySize = parentGridData.displaySize;

      return DesignGridData(
        columns: columns,
        // TODO maybe introduce top level design grid 'theme' to set default spacing padding and number of columns
        // TODO said theme could also hold the displaySize
        columnWidth: columnWidth,
        columnSpacing: columnSpacing,
        displaySize: displaySize,
        child: Wrap(
          spacing: columnSpacing,
          runSpacing: rowSpacing,
          children: children.where((child) => child.getColumns(displaySize) > 0).toList(),
        ),
      );
    }

    // TODO this should be found out only once on the root grid
    final displayWidth = MediaQuery.of(context).size.width;

    final displaySize = DisplaySize.fromWidth(displayWidth);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gridPadding),
      // TODO this layoutbuilder should be used as little as possible, maybe even consider an extra widget that is only used for the root grid
      child: LayoutBuilder(
        builder: (context, constraints) {
          double columnWidth = _calculateColumnWidth(constraints.biggest.width);

          // TODO implement enum to switch between row and wrap
          return DesignGridData(
            columns: columns,
            columnWidth: columnWidth,
            columnSpacing: columnSpacing,
            displaySize: displaySize,
            child: Wrap(
              spacing: columnSpacing,
              runSpacing: rowSpacing,
              children: children.where((child) => child.getColumns(displaySize) > 0).toList(),
            ),
          );
        },
      ),
    );
  }

  double _calculateColumnWidth(double width) {
    // TODO check width calculation of flexible widget and how they avoid rounding errors

    final spacers = columns - 1;

    final totalSpacingWidth = spacers * columnSpacing;

    var columnWidth = (width - totalSpacingWidth) / columns;

    columnWidth = (columnWidth * 100).floorToDouble() / 100;

    return columnWidth;
  }
}
