import 'package:flutter/widgets.dart';
import 'package:grid/display_size.dart';

class GridData extends InheritedWidget {
  /// The number of columns in the grid.
  final int columns;

  /// The width of a column in the grid.
  final double columnWidth;

  /// The size of the display.
  final DisplaySize displaySize;

  /// The spacing between columns.
  final double columnSpacing;

  const GridData({
    super.key,
    required this.columns,
    required this.columnWidth,
    required this.columnSpacing,
    required this.displaySize,
    required super.child,
  }) : super();

  static GridData of(BuildContext context) {
    final gridData = context.dependOnInheritedWidgetOfExactType<GridData>();

    assert(
      gridData != null,
      'GridData.of() called with a context that does not contain a GridData.',
    );

    return gridData!;
  }

  @override
  bool updateShouldNotify(covariant GridData oldWidget) {
    return columns != oldWidget.columns ||
        columnWidth != oldWidget.columnWidth ||
        displaySize != oldWidget.displaySize ||
        columnSpacing != oldWidget.columnSpacing;
  }
}
