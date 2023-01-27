import 'package:flutter/widgets.dart';

class DesignGridChildWidth extends InheritedWidget {
  final double width;

  const DesignGridChildWidth({
    super.key,
    required this.width,
    required super.child,
  }) : super();

  static DesignGridChildWidth of(BuildContext context) {
    final childWidth = maybeOf(context);

    assert(
      childWidth != null,
      'DesignGridChildWidth.of() called with a context that does not contain a DesignGridChildWidth.',
    );

    return childWidth!;
  }

  static DesignGridChildWidth? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DesignGridChildWidth>();

  @override
  bool updateShouldNotify(covariant DesignGridChildWidth oldWidget) {
    return oldWidget.width != width;
  }
}
