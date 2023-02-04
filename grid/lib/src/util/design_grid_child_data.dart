import 'package:flutter/widgets.dart';

class DesignGridChildData extends InheritedWidget {
  /// The number of columns the child should take up.
  final int columns;

  /// The calculated width of the child.
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
      'DesignGridChildData.of() called with a context that does not contain a DesignGridChildData.',
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
