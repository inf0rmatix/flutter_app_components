library grid;

import 'package:flutter/widgets.dart';
import 'package:grid/display_size.dart';
import 'package:grid/grid_child.dart';
import 'package:grid/grid_data.dart';

export 'grid_child.dart';

class Grid extends StatelessWidget {
  static const defaultColumns = 12;
  static const defaultOuterPadding = 16.0;
  static const defaultInnerPadding = 8.0;

  /// The children of the grid.
  final List<GridChild> children;

  /// The number of columns in the grid.
  final int columns;

  /// The padding on the left and right of the grid.
  final double gridPadding;

  /// The spacing between columns.
  final double columnSpacing;

  const Grid({
    super.key,
    this.columns = defaultColumns,
    required this.children,
    this.gridPadding = defaultOuterPadding,
    this.columnSpacing = defaultInnerPadding,
  });

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gridPadding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final spacers = columns - 1;

          final totalSpacingWidth = spacers * columnSpacing;

          var columnWidth = (width - totalSpacingWidth) / columns;

          columnWidth = (columnWidth * 100).floorToDouble() / 100;

          final displaySize = DisplaySize.fromWidth(displayWidth);

          // TODO implement enum to switch between row and wrap
          return GridData(
            columns: columns,
            columnWidth: columnWidth,
            columnSpacing: columnSpacing,
            displaySize: displaySize,
            child: Wrap(
              spacing: columnSpacing,
              children: children.where((child) => child.getColumns(displaySize) > 0).toList(),
            ),
          );
        },
      ),
    );
  }
}
