import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class DesignGridDisplaySizeScope extends InheritedWidget {
  final DisplaySize displaySize;

  const DesignGridDisplaySizeScope({
    super.key,
    required this.displaySize,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant DesignGridDisplaySizeScope oldWidget) {
    return oldWidget.displaySize != displaySize;
  }
}
