library design_grid;

import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_calculator.dart';
import 'package:design_grid/src/design_grid_data.dart';
import 'package:design_grid/src/design_grid_display_size.dart';
import 'package:flutter/widgets.dart';

export 'src/design_grid_alignment.dart';
export 'src/design_grid_child.dart';
export 'src/design_grid_child_break.dart';
export 'src/design_grid_child_data.dart';
export 'src/design_grid_config.dart';
export 'src/design_grid_debug_overlay.dart';
export 'src/design_grid_layout_type.dart';
export 'src/design_grid_theme.dart';
export 'src/design_grid_theme_data.dart';
export 'src/display_size.dart';

class DesignGrid extends StatelessWidget {
  /// The horizontal alignment of the [DesignGridChild]ren.
  final DesignGridAlignment alignment;

  /// Determines whether the children are wrapped or not.
  final DesignGridLayoutType layoutType;

  /// Whether to use the outer padding of the grid or not. Top level grid will be true by default, nested grids will be false by default.
  final bool? useOuterPadding;

  /// By default only the top most grid will calculate the layout. If this grid is nested and should calculate the layout, set this to true.
  /// This is useful, if you use the [DesignGrid] inside a child but the [DesignGrid] itself doesn't get the full width, i.e. inside a card or a setup with other widgets.
  final bool? shouldCalculateLayout;

  /// The children of the grid.
  final List<DesignGridChild> children;

  const DesignGrid({
    super.key,
    this.alignment = DesignGridAlignment.start,
    this.layoutType = DesignGridLayoutType.wrap,
    this.useOuterPadding,
    this.shouldCalculateLayout,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final displaySize = DesignGridDisplaySize.of(context);

    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    final parentGridData = DesignGridData.maybeOf(context);

    final isNested = parentGridData != null;

    final shouldCalculateLayout = this.shouldCalculateLayout ?? !isNested;

    final useOuterPadding = this.useOuterPadding ?? !isNested;

    final visibleChildren =
        children.where((child) => child.getColumns(displaySize) > 0 || child is DesignGridChildBreak).toList();

    if (!shouldCalculateLayout) {
      final gridChildData = DesignGridChildData.of(context);

      final width = gridChildData.width;

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

      return DesignGridData(
        columnSizes: columnSizes,
        displaySize: displaySize,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: useOuterPadding ? theme.gridPadding : 0),
          child: _DesignGridLayoutBuilder(
            alignment: alignment,
            layoutType: layoutType,
            children: sizedChildren,
          ),
        ),
      );
    }

    // This is the top level grid or a nested grid that should calculate the layout

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: useOuterPadding ? theme.gridPadding : 0),
      // LayoutBuilder is heavy on performance and should be used as little as possible
      child: LayoutBuilder(
        builder: (context, constraints) {
          // TODO code from this point on can be extracted into a separate widget
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

          return DesignGridData(
            columnSizes: columnSizes,
            displaySize: displaySize,
            child: _DesignGridLayoutBuilder(
              layoutType: layoutType,
              alignment: alignment,
              children: sizedChildren,
            ),
          );
        },
      ),
    );
  }
}

class _DesignGridLayoutBuilder extends StatelessWidget {
  final DesignGridLayoutType layoutType;

  final DesignGridAlignment alignment;

  final List<Widget> children;

  const _DesignGridLayoutBuilder({
    required this.layoutType,
    required this.alignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    switch (layoutType) {
      case DesignGridLayoutType.wrap:
        return _DesignGridWrapLayoutBuilder(
          alignment: alignment,
          children: children,
        );
      case DesignGridLayoutType.row:
        return _DesignGridRowLayoutBuilder(
          alignment: alignment,
          children: children,
        );
    }
  }
}

class _DesignGridWrapLayoutBuilder extends StatelessWidget {
  final DesignGridAlignment alignment;

  final List<Widget> children;

  const _DesignGridWrapLayoutBuilder({
    required this.alignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    return Wrap(
      spacing: theme.columnSpacing,
      runSpacing: theme.rowSpacing,
      alignment: alignment.toWrapAlignment(),
      children: children,
    );
  }
}

class _DesignGridRowLayoutBuilder extends StatelessWidget {
  final DesignGridAlignment alignment;

  final List<Widget> children;

  const _DesignGridRowLayoutBuilder({
    required this.alignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    return Row(
      mainAxisAlignment: alignment.toMainAxisAlignment(),
      children: children
          .expand((child) => [
                child,
                if (children.last != child) SizedBox(width: theme.columnSpacing),
              ])
          .toList(),
    );
  }
}
