library grid;

import 'package:design_grid/design_grid_alignment.dart';
import 'package:design_grid/design_grid_layout_type.dart';
import 'package:flutter/widgets.dart';

import 'design_grid_child.dart';
import 'design_grid_child_data.dart';
import 'design_grid_data.dart';
import 'design_grid_theme.dart';
import 'design_grid_theme_data.dart';
import 'display_size.dart';

export 'design_grid_alignment.dart';
export 'design_grid_child.dart';
export 'design_grid_layout_type.dart';
export 'design_grid_theme.dart';
export 'design_grid_theme_data.dart';

// TODO add a helper widget to get a column overlay on top of the app (could be inside the root design grid display size provider)

class DesignGrid extends StatelessWidget {
  /// The children of the grid.
  final List<DesignGridChild> children;

  /// The number of columns in the grid.
  final int? columns;

  /// The padding on the left and right of the grid. Defaults to zero if inside another grid.
  final double? gridPadding;

  /// The spacing between columns.
  final double? columnSpacing;

  /// The spacing between rows.
  final double? rowSpacing;

  /// The horizontal alignment of the [DesignGridChild]ren.
  final DesignGridAlignment alignment;

  /// Determines whether the children are wrapped or not.
  final DesignGridLayoutType layoutType;

  const DesignGrid({
    super.key,
    this.columns,
    required this.children,
    this.gridPadding,
    this.columnSpacing,
    this.rowSpacing,
    this.alignment = DesignGridAlignment.start,
    this.layoutType = DesignGridLayoutType.wrap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = DesignGridTheme.maybeOf(context) ??
        DesignGridThemeData(
          columnSpacing: columnSpacing,
          rowSpacing: rowSpacing,
          gridPadding: gridPadding,
        );

    final parentGridData = DesignGridData.maybeOf(context);

    final isNested = parentGridData != null;

    if (isNested) {
      final gridChildData = DesignGridChildData.of(context);

      final width =
          gridChildData.columns * parentGridData.columnWidth + (gridChildData.columns - 1) * theme.columnSpacing;

      final columnWidth = calculateColumnWidth(width, theme);

      final displaySize = parentGridData.displaySize;

      // TODO this is duplicated code right now
      Widget widget;

      final visibleChildren = children.where((child) => child.getColumns(displaySize) > 0).toList();

      switch (layoutType) {
        case DesignGridLayoutType.wrap:
          widget = Wrap(
            spacing: theme.columnSpacing,
            runSpacing: theme.rowSpacing,
            alignment: alignment.toWrapAlignment(),
            children: visibleChildren,
          );
          break;
        case DesignGridLayoutType.row:
          widget = Row(
            mainAxisAlignment: alignment.toMainAxisAlignment(),
            children: visibleChildren
                .expand((element) => [
                      element,
                      if (visibleChildren.last != element) SizedBox(width: columnSpacing),
                    ])
                .toList(),
          );
          break;
      }

      return DesignGridData(
        // TODO maybe introduce top level design grid 'theme' to set default spacing padding and number of columns
        // TODO said theme could also hold the displaySize
        columnWidth: columnWidth,
        displaySize: displaySize,
        child: widget,
      );
    }

    // TODO this should be found out only once on the root grid
    final displayWidth = MediaQuery.of(context).size.width;

    final displaySize = DisplaySize.fromWidth(displayWidth);

    // TODO this is duplicated code right now
    Widget widget;

    final visibleChildren = children.where((child) => child.getColumns(displaySize) > 0).toList();

    switch (layoutType) {
      case DesignGridLayoutType.wrap:
        widget = Wrap(
          spacing: theme.columnSpacing,
          runSpacing: theme.rowSpacing,
          alignment: alignment.toWrapAlignment(),
          children: visibleChildren,
        );
        break;
      case DesignGridLayoutType.row:
        widget = Row(
          mainAxisAlignment: alignment.toMainAxisAlignment(),
          children: visibleChildren
              .expand((element) => [
                    element,
                    if (visibleChildren.last != element) SizedBox(width: columnSpacing),
                  ])
              .toList(),
        );
        break;
    }

    return DesignGridTheme(
      data: theme,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.gridPadding),
        // TODO this layoutbuilder should be used as little as possible, maybe even consider an extra widget that is only used for the root grid
        child: LayoutBuilder(
          builder: (context, constraints) {
            double columnWidth = calculateColumnWidth(constraints.biggest.width, theme);

            return DesignGridData(
              columnWidth: columnWidth,
              displaySize: displaySize,
              child: widget,
            );
          },
        ),
      ),
    );
  }

  @visibleForTesting
  static double calculateColumnWidth(double width, DesignGridThemeData theme) {
    // TODO check width calculation of flexible widget and how they avoid rounding errors

    final spacers = theme.columns - 1;

    final totalSpacingWidth = spacers * theme.columnSpacing;

    var columnWidth = (width - totalSpacingWidth) / theme.columns;

    columnWidth = (columnWidth * 100000).floorToDouble() / 100000;

    return columnWidth;
  }
}
