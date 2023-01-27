import 'package:flutter/widgets.dart';

class DesignGridChildData extends InheritedWidget {
  /// The number of columns the child should take up.
  final int columns;

  final double width;

  const DesignGridChildData({
    super.key,
    required this.columns,
    required this.width,
    required super.child,
  }) : super();

  static DesignGridChildData of(BuildContext context) {
    final gridData = maybeOf(context);

    assert(
      gridData != null,
      'GridData.of() called with a context that does not contain a GridData.',
    );

    return gridData!;
  }

  static DesignGridChildData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DesignGridChildData>();

  @override
  bool updateShouldNotify(covariant DesignGridChildData oldWidget) {
    return columns != oldWidget.columns || width != oldWidget.width;
  }
}
