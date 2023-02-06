library design_grid;

import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_column_sizes.dart';
import 'package:flutter/widgets.dart';

export 'src/display_size/display_size.dart';
export 'src/enums/enums.dart';
export 'src/theme/theme.dart';
export 'src/util/design_grid_child_data.dart';
export 'src/util/util.dart';
export 'src/widgets/widgets.dart';

// TODO refactor so that
// DesignGrid
//  - Row
//     - DesignGridChild - rename to DesignGridItem
// - Row
//    - DesignGridChild
//    - DesignGridChild

/// To implement a design system with a column-grid, you can use this widget.
///
/// To get started, you need to wrap your home widget or router with the [DesignGridConfig] widget.
///
/// This widget will use the [DesignGridDisplaySizeConfig] to provide the current [DesignGridDisplaySize] to all children.
///
/// To adjust the number of columns, column-spacing and the grid's outer padding, use [DesignGridConfig.theme].
///
/// To adjust the display size, use [DesignGridConfig.displaySize], this is not recommended for production since it completely overrides the display size.
///
/// The [DesignGrid] widget will calculate the layout based on the current [DesignGridDisplaySize] and the [DesignGridTheme].
/// You can use the [DesignGridChild] widget to define the number of columns for a child, depending on the display size.
///
/// [DesignGridChildBreak] widget will define a break in the grid, i.e. a new row.
///
/// Alternatively you can use multiple [DesignGrid] in a [Column] or [ListView]. This will also greatly improve performance in [ListView].
///
/// Nesting grids is possible by using the [DesignGrid] widget inside a [DesignGridChild].
///
/// The [DesignGrid] widget will automatically calculate the layout, if it is the top most grid.
/// If you use the [DesignGrid] inside a child but the [DesignGrid] itself doesn't get the full width, i.e. inside a card or a setup with other widgets, you can set [DesignGrid.shouldCalculateLayout] to true.
///
/// Example:
/// TODO: Add example
/// TODO maybe rename to ResponsiveDesignGrid or ResponsiveGrid (package name however should stay design_grid)
class DesignGrid extends StatelessWidget {
  // /// Determines whether the children are wrapped or not.
  // final DesignGridLayoutType layoutType;

  /// Whether to use the outer padding of the grid or not. Top level grid will be true by default, nested grids will be false by default.
  final bool? useOuterPadding;

  /// By default only the top most grid will calculate the layout. If this grid is nested and should calculate the layout, set this to true.
  /// This is useful, if you use the [DesignGrid] inside a child but the [DesignGrid] itself doesn't get the full width, i.e. inside a card or a setup with other widgets.
  final bool? shouldCalculateLayout;

  final List<DesignGridRow> children;

  const DesignGrid({
    super.key,
    this.useOuterPadding,
    this.shouldCalculateLayout,
    required this.children,
  });

  // factory DesignGrid.row({
  //   Key? key,
  //   DesignGridAlignment alignment = DesignGridAlignment.start,
  //   bool? useOuterPadding,
  //   bool? shouldCalculateLayout,
  //   required List<DesignGridChild> children,
  // }) {
  //   return DesignGrid(
  //     key: key,
  //     alignment: alignment,
  //     useOuterPadding: useOuterPadding,
  //     shouldCalculateLayout: shouldCalculateLayout,
  //     layoutType: DesignGridLayoutType.row,
  //     children: children,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final parentGridData = DesignGridChildData.maybeOf(context);

    final isNested = parentGridData != null;

    final shouldCalculateLayout = this.shouldCalculateLayout ?? !isNested;

    final useOuterPadding = this.useOuterPadding ?? !isNested;

    // final visibleChildren =
    //     children.where((child) => child.columns.getColumns(displaySize) > 0 || child is DesignGridChildBreak).toList();

    if (shouldCalculateLayout) {
      // Avoid using LayoutBuilder if possible, because it will rebuild the whole grid on every change and is bad for performance.
      return LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.biggest.width;

          return _DesignGridBuilder(
            useOuterPadding: useOuterPadding,
            width: width,
            children: children,
          );
        },
      );
    } else {
      final gridChildData = DesignGridChildData.maybeOf(context);

      if (gridChildData == null) {
        throw Exception('Should calculate layout is set to false, but this widget is not a child of a DesignGrid.');
      }

      final width = gridChildData.width;

      return _DesignGridBuilder(
        useOuterPadding: useOuterPadding,
        width: width,
        children: children,
      );
    }
  }
}

class _DesignGridBuilder extends StatelessWidget {
  final bool useOuterPadding;

  final double width;

  final List<DesignGridRow> children;

  const _DesignGridBuilder({
    required this.useOuterPadding,
    required this.width,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    final availableWidth = useOuterPadding ? width - theme.gridPadding * 2 : width;

    final columnSizes = DesignGridCalculator.calculateColumnSizes(availableWidth, theme);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: useOuterPadding ? theme.gridPadding : 0),
      child: DesignGridColumnSizes(
        sizes: columnSizes,
        child: Column(
          children: children
              .expand((child) => [
                    child,
                    if (children.last != child)
                      SizedBox(
                        height: theme.rowSpacing,
                      ),
                  ])
              .toList(),
        ),
      ),
    );
  }
}
