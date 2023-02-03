library design_grid;

import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_calculator.dart';
import 'package:design_grid/src/layout_widgets/design_grid_layout_builder.dart';
import 'package:flutter/widgets.dart';

export 'src/design_grid_child_data.dart';
export 'src/display_size/display_size.dart';
export 'src/enums/enums.dart';
export 'src/theme/theme.dart';
export 'src/widgets/widgets.dart';

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

  factory DesignGrid.row({
    Key? key,
    DesignGridAlignment alignment = DesignGridAlignment.start,
    bool? useOuterPadding,
    bool? shouldCalculateLayout,
    required List<DesignGridChild> children,
  }) {
    return DesignGrid(
      key: key,
      alignment: alignment,
      useOuterPadding: useOuterPadding,
      shouldCalculateLayout: shouldCalculateLayout,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    final displaySize = DesignGridDisplaySizeConfig.of(context);

    final parentGridData = DesignGridChildData.maybeOf(context);

    final isNested = parentGridData != null;

    final shouldCalculateLayout = this.shouldCalculateLayout ?? !isNested;

    final useOuterPadding = this.useOuterPadding ?? !isNested;

    final visibleChildren =
        children.where((child) => child.getColumns(displaySize) > 0 || child is DesignGridChildBreak).toList();

    if (shouldCalculateLayout) {
      // Avoid using LayoutBuilder if possible, because it will rebuild the whole grid on every change and is bad for performance.
      return LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.biggest.width;

          return _DesignGridBuilder(
            visibleChildren: visibleChildren,
            useOuterPadding: useOuterPadding,
            alignment: alignment,
            layoutType: layoutType,
            width: width,
          );
        },
      );
    } else {
      final gridChildData = DesignGridChildData.of(context);

      final width = gridChildData.width;

      return _DesignGridBuilder(
        visibleChildren: visibleChildren,
        useOuterPadding: useOuterPadding,
        alignment: alignment,
        layoutType: layoutType,
        width: width,
      );
    }
  }
}

class _DesignGridBuilder extends StatelessWidget {
  final List<DesignGridChild> visibleChildren;

  final bool useOuterPadding;

  final DesignGridAlignment alignment;

  final DesignGridLayoutType layoutType;

  final double width;

  const _DesignGridBuilder({
    required this.visibleChildren,
    required this.useOuterPadding,
    required this.alignment,
    required this.layoutType,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final displaySize = DesignGridDisplaySizeConfig.of(context);

    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    final availableWidth = useOuterPadding ? width - theme.gridPadding * 2 : width;

    final columnSizes = DesignGridCalculator.calculateColumnSizes(availableWidth, theme);

    final sizedChildren = <Widget>[];

    var columnCounter = 0;

    for (final child in visibleChildren) {
      final isChildBreak = child is DesignGridChildBreak;

      final columns = isChildBreak ? theme.columns - columnCounter : child.getColumns(displaySize);

      // ignore the break if the row is already full or we are already starting a new row
      if (isChildBreak && (columns >= theme.columns || columns <= 0)) continue;

      if (columnCounter + columns > theme.columns) {
        columnCounter = 0;
      }

      final columnSize =
          columnSizes.sublist(columnCounter, columns + columnCounter).reduce((value, element) => value + element);

      final spannedSpacers = columns - 1;

      final spannedSpacersSize = spannedSpacers * theme.columnSpacing;

      final childSize = columnSize + spannedSpacersSize;

      columnCounter += columns;

      final childWidget = DesignGridChildData(
        columns: columns,
        width: childSize,
        child: child,
      );

      sizedChildren.add(childWidget);
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: useOuterPadding ? theme.gridPadding : 0),
      child: DesignGridLayoutBuilder(
        alignment: alignment,
        layoutType: layoutType,
        children: sizedChildren,
      ),
    );
  }
}
