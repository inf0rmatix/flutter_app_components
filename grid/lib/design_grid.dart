library design_grid;

import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_calculator.dart';
import 'package:design_grid/src/design_grid_data.dart';
import 'package:flutter/widgets.dart';

export 'src/design_grid_alignment.dart';
export 'src/design_grid_child.dart';
export 'src/design_grid_child_break.dart';
export 'src/design_grid_child_data.dart';
export 'src/design_grid_layout_type.dart';
export 'src/design_grid_theme.dart';
export 'src/design_grid_theme_data.dart';
export 'src/display_size.dart';

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
  })  : assert((columns ?? 1) > 0 || columns == null, 'The number of columns must be greater than zero'),
        assert((gridPadding ?? 1) % 1 == 0, 'The grid padding must not have a fractional part'),
        assert((columnSpacing ?? 1) % 1 == 0, 'The column spacing must not have a fractional part'),
        assert((rowSpacing ?? 1) % 1 == 0, 'The row spacing must not have a fractional part');

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

    if (isNested) {
      final columnSizes = DesignGridCalculator.calculateColumnSizes(width, theme);

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
                      if (sizedChildren.last != child) SizedBox(width: columnSpacing),
                    ])
                .toList(),
          );
          break;
      }

      return DesignGridTheme(
        data: theme,
        child: DesignGridData(
          columnSizes: columnSizes,
          displaySize: displaySize,
          child: widget,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.gridPadding),
      // LayoutBuilder is heavy on performance and should be used as little as possible
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columnSizes = DesignGridCalculator.calculateColumnSizes(constraints.biggest.width, theme);

          final sizedChildren = <Widget>[];

          var columnCounter = 0;

          for (final child in visibleChildren) {
            final columns = child.getColumns(displaySize);

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
                          if (sizedChildren.last != child) SizedBox(width: columnSpacing),
                        ])
                    .toList(),
              );
              break;
          }

          return DesignGridTheme(
            data: theme,
            child: DesignGridData(
              columnSizes: columnSizes,
              displaySize: displaySize,
              child: widget,
            ),
          );
        },
      ),
    );
  }
}
