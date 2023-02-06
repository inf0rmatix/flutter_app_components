import 'package:flutter/widgets.dart';

class DesignGridItemData extends InheritedWidget {
  /// The number of columns the child should take up.
  final int columns;

  /// The calculated width of the child.
  final double width;

  const DesignGridItemData({
    super.key,
    required this.columns,
    required this.width,
    required super.child,
  }) : super();

  static DesignGridItemData of(BuildContext context) {
    final gridData = maybeOf(context);

    assert(
      gridData != null,
      'DesignGridChildData.of() called with a context that does not contain a DesignGridChildData.',
    );

    return gridData!;
  }

  static DesignGridItemData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DesignGridItemData>();

  @override
  bool updateShouldNotify(covariant DesignGridItemData oldWidget) {
    return columns != oldWidget.columns || width != oldWidget.width;
  }
}
