// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'display_size.dart';

class DesignGridData extends InheritedWidget {
  /// The width of a column in the grid.
  final List<double> columnSizes;

  /// The size of the display.
  final DisplaySize displaySize;

  const DesignGridData({
    super.key,
    required this.columnSizes,
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
    return oldWidget.columnSizes != columnSizes || oldWidget.displaySize != displaySize;
  }
}
