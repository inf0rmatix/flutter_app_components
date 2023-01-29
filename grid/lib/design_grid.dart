library design_grid;

import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_calculator.dart';
import 'package:design_grid/src/design_grid_data.dart';
import 'package:flutter/widgets.dart';

export 'src/design_grid_alignment.dart';
export 'src/design_grid_child.dart';
export 'src/design_grid_child_break.dart';
export 'src/design_grid_child_data.dart';
export 'src/design_grid_debug_overlay.dart';
export 'src/design_grid_layout_type.dart';
export 'src/design_grid_theme.dart';
export 'src/design_grid_theme_data.dart';
export 'src/display_size.dart';

class DesignGrid extends StatelessWidget {
  /// The children of the grid.
  final List<DesignGridChild> children;

  /// The horizontal alignment of the [DesignGridChild]ren.
  final DesignGridAlignment alignment;

  /// Determines whether the children are wrapped or not.
  final DesignGridLayoutType layoutType;

  /// Whether to use the outer padding of the grid or not. Top level grid will be true by default, nested grids will be false by default.
  final bool? useOuterPadding;

  /// By default only the top most grid will calculate the layout. If this grid is nested and should calculate the layout, set this to true.
  /// This is useful, if you use the [DesignGrid] inside a child but the [DesignGrid] itself doesn't get the full width, i.e. inside a card or a setup with other widgets.
  final bool? shouldCalculateLayout;

  const DesignGrid({
    super.key,
    required this.children,
    this.alignment = DesignGridAlignment.start,
    this.layoutType = DesignGridLayoutType.wrap,
    this.useOuterPadding,
    this.shouldCalculateLayout,
  });

  @override
  Widget build(BuildContext context) {
    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    final parentGridData = DesignGridData.maybeOf(context);

    final shouldCalculateLayout = this.shouldCalculateLayout ?? parentGridData == null;

    final isNested = parentGridData != null;

    final useOuterPadding = this.useOuterPadding ?? !isNested;

    late final double width;
    late final DisplaySize displaySize;

    if (isNested) {
      final gridChildData = DesignGridChildData.of(context);

      width = gridChildData.width;

      displaySize = parentGridData.displaySize;
    } else {
      width = MediaQuery.of(context).size.width;

      displaySize = DisplaySize.fromWidth(width);
    }

    final visibleChildren =
        children.where((child) => child.getColumns(displaySize) > 0 || child is DesignGridChildBreak).toList();

    if (!shouldCalculateLayout) {
      final availableWidth = useOuterPadding ? width - theme.gridPadding * 2 : width;

      final columnSizes = DesignGridCalculator.calculateColumnSizes(availableWidth, theme);

      final sizedChildren = <Widget>[];

      var columnCounter = 0;

      for (final child in visibleChildren) {
        final isChildBreak = child is DesignGridChildBreak;

        final columns = isChildBreak ? theme.columns - columnCounter : child.getColumns(displaySize);

        // ignore the break if the row is already full
        if (isChildBreak && (columns >= theme.columns || columns <= 0)) continue;

        if (columnCounter + columns > theme.columns) {
          columnCounter = 0;
        }

        final columnSize =
            columnSizes.sublist(columnCounter, columns + columnCounter).reduce((value, element) => value + element);

        final childSize = columnSize + (columns - 1) * theme.columnSpacing;

        columnCounter += columns;

        final childWidget = DesignGridChildData(
          columns: columns,
          width: childSize,
          child: child,
        );

        sizedChildren.add(childWidget);
      }

      Widget widget;

      switch (layoutType) {
        case DesignGridLayoutType.wrap:
          widget = Wrap(
            spacing: theme.columnSpacing,
            runSpacing: theme.rowSpacing,
            alignment: alignment.toWrapAlignment(),
            children: sizedChildren,
          );
          break;
        case DesignGridLayoutType.row:
          widget = Row(
            mainAxisAlignment: alignment.toMainAxisAlignment(),
            children: sizedChildren
                .expand((child) => [
                      child,
                      if (sizedChildren.last != child) SizedBox(width: theme.columnSpacing),
                    ])
                .toList(),
          );
          break;
      }

      return DesignGridData(
        columnSizes: columnSizes,
        displaySize: displaySize,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: useOuterPadding ? theme.gridPadding : 0),
          child: widget,
        ),
      );
    }

    // This is the top level grid or a nested grid that should calculate the layout

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: useOuterPadding ? theme.gridPadding : 0),
      // LayoutBuilder is heavy on performance and should be used as little as possible
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columnSizes = DesignGridCalculator.calculateColumnSizes(constraints.biggest.width, theme);

          final sizedChildren = <Widget>[];

          var columnCounter = 0;

          for (final child in visibleChildren) {
            final isChildBreak = child is DesignGridChildBreak;

            final columns = isChildBreak ? theme.columns - columnCounter : child.getColumns(displaySize);

            // ignore the break if the row is already full
            if (isChildBreak && (columns >= theme.columns || columns <= 0)) continue;

            if (columnCounter + columns > theme.columns) {
              columnCounter = 0;
            }

            final columnSize =
                columnSizes.sublist(columnCounter, columns + columnCounter).reduce((value, element) => value + element);

            final childSize = columnSize + (columns - 1) * theme.columnSpacing;

            columnCounter += columns;

            final childWidget = DesignGridChildData(
              columns: columns,
              width: childSize,
              child: child,
            );

            sizedChildren.add(childWidget);
          }

          Widget widget;

          switch (layoutType) {
            case DesignGridLayoutType.wrap:
              widget = Wrap(
                spacing: theme.columnSpacing,
                runSpacing: theme.rowSpacing,
                alignment: alignment.toWrapAlignment(),
                children: sizedChildren,
              );
              break;
            case DesignGridLayoutType.row:
              widget = Row(
                mainAxisAlignment: alignment.toMainAxisAlignment(),
                children: sizedChildren
                    .expand((child) => [
                          child,
                          if (sizedChildren.last != child) SizedBox(width: theme.columnSpacing),
                        ])
                    .toList(),
              );
              break;
          }

          return DesignGridData(
            columnSizes: columnSizes,
            displaySize: displaySize,
            child: widget,
          );
        },
      ),
    );
  }
}
