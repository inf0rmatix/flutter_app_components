import 'package:flutter/widgets.dart';

import 'display_size.dart';

class DesignGridData extends InheritedWidget {
  /// The number of columns in the grid.
  final int columns;

  /// The width of a column in the grid.
  final double columnWidth;

  /// The size of the display.
  final DisplaySize displaySize;

  /// The spacing between columns.
  final double columnSpacing;

  const DesignGridData({
    super.key,
    required this.columns,
    required this.columnWidth,
    required this.columnSpacing,
    required this.displaySize,
    required super.child,
  }) : super();

  static DesignGridData of(BuildContext context) {
    final gridData = maybeOf(context);

    assert(
      gridData != null,
      'GridData.of() called with a context that does not contain a GridData.',
    );

    return gridData!;
  }

  static DesignGridData? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<DesignGridData>();

  @override
  bool updateShouldNotify(covariant DesignGridData oldWidget) {
    return columns != oldWidget.columns ||
        columnWidth != oldWidget.columnWidth ||
        displaySize != oldWidget.displaySize ||
        columnSpacing != oldWidget.columnSpacing;
  }
}
