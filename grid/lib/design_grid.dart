library grid;

import 'package:design_grid/design_grid_alignment.dart';
import 'package:design_grid/design_grid_layout_type.dart';
import 'package:flutter/widgets.dart';

import 'design_grid_child.dart';
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

    final displayWidth = MediaQuery.of(context).size.width;

    final displaySize = DisplaySize.fromWidth(displayWidth);

    final visibleChildren = children.where((child) => child.getColumns(displaySize) > 0).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.gridPadding),
      child: LayoutBuilder(builder: (context, constraints) {
        final columnSizes = calculateColumnSizes(constraints.biggest.width, theme);

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

          final childWidget = SizedBox(
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
      }),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final theme = DesignGridTheme.maybeOf(context) ??
  //       DesignGridThemeData(
  //         columnSpacing: columnSpacing,
  //         rowSpacing: rowSpacing,
  //         gridPadding: gridPadding,
  //       );

  //   final parentGridData = DesignGridData.maybeOf(context);

  //   final isNested = parentGridData != null;

  //   // TODO
  //   // if (isNested) {
  //   //   final gridChildData = DesignGridChildData.of(context);

  //   //   final totalColumnWidth = gridChildData.columns * parentGridData.columnWidth;

  //   //   final width =
  //   //       gridChildData.columns * parentGridData.columnWidth + (gridChildData.columns - 1) * theme.columnSpacing;

  //   //   final columnSizes = calculateColumnSizes(width, theme);

  //   //   final displaySize = parentGridData.displaySize;

  //   //   // TODO this is duplicated code right now
  //   //   Widget widget;

  //   //   final visibleChildren = children.where((child) => child.getColumns(displaySize) > 0).toList();

  //   //   switch (layoutType) {
  //   //     case DesignGridLayoutType.wrap:
  //   //       widget = Wrap(
  //   //         spacing: theme.columnSpacing,
  //   //         runSpacing: theme.rowSpacing,
  //   //         alignment: alignment.toWrapAlignment(),
  //   //         children: visibleChildren,
  //   //       );
  //   //       break;
  //   //     case DesignGridLayoutType.row:
  //   //       widget = Row(
  //   //         mainAxisAlignment: alignment.toMainAxisAlignment(),
  //   //         children: visibleChildren
  //   //             .expand((element) => [
  //   //                   element,
  //   //                   if (visibleChildren.last != element) SizedBox(width: columnSpacing),
  //   //                 ])
  //   //             .toList(),
  //   //       );
  //   //       break;
  //   //   }

  //   //   return DesignGridData(
  //   //     // TODO maybe introduce top level design grid 'theme' to set default spacing padding and number of columns
  //   //     // TODO said theme could also hold the displaySize
  //   //     columnSizes: columnSizes,
  //   //     displaySize: displaySize,
  //   //     child: widget,
  //   //   );
  //   // }

  //   // TODO this should be found out only once on the root grid
  //   final displayWidth = MediaQuery.of(context).size.width;

  //   final displaySize = DisplaySize.fromWidth(displayWidth);

  //   final visibleChildren = children.where((child) => child.getColumns(displaySize) > 0).toList();

  //   return DesignGridTheme(
  //     data: theme,
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: theme.gridPadding),
  //       // TODO this layoutbuilder should be used as little as possible, maybe even consider an extra widget that is only used for the root grid
  //       child: LayoutBuilder(
  //         builder: (context, constraints) {
  //           final columnSizes = calculateColumnSizes(constraints.biggest.width, theme);

  //           final wrappedChildren = <Widget>[];

  //           var columnCounter = 0;

  //           for (final child in visibleChildren) {
  //             final columns = child.getColumns(displaySize);

  //             // get the columns for the child
  //             // calculate the width of the child
  //             // wrap the child in a sized box with the calculated width
  //             final isGoingToWrap = columnCounter + columns > theme.columns;

  //             if (isGoingToWrap) {
  //               columnCounter = 0;
  //             }

  //             final spannedSpacers = columns - 1;

  //             final columnWidths = columnSizes
  //                 .sublist(columnCounter, columnCounter + columns)
  //                 .reduce((value, element) => value + element);

  //             final width = columnWidths + spannedSpacers * theme.columnSpacing;

  //             columnCounter += columns;

  //             wrappedChildren.add(
  //               SizedBox(
  //                 width: width,
  //                 child: child,
  //               ),
  //             );
  //           }

  //           // TODO this is duplicated code right now
  //           Widget widget;

  //           switch (layoutType) {
  //             case DesignGridLayoutType.wrap:
  //               widget = Wrap(
  //                 spacing: theme.columnSpacing,
  //                 runSpacing: theme.rowSpacing,
  //                 alignment: alignment.toWrapAlignment(),
  //                 children: wrappedChildren,
  //               );
  //               break;
  //             case DesignGridLayoutType.row:
  //               widget = Row(
  //                 mainAxisAlignment: alignment.toMainAxisAlignment(),
  //                 children: wrappedChildren
  //                     .expand((child) => [
  //                           child,
  //                           if (wrappedChildren.last != child) SizedBox(width: columnSpacing),
  //                         ])
  //                     .toList(),
  //               );
  //               break;
  //           }

  //           return DesignGridData(
  //             columnSizes: columnSizes,
  //             displaySize: displaySize,
  //             child: widget,
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  @visibleForTesting
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
