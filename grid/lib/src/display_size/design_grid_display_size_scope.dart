import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class DesignGridDesignGridDisplaySizeScope extends InheritedWidget {
  final DesignGridDisplaySize displaySize;

  const DesignGridDesignGridDisplaySizeScope({
    super.key,
    required this.displaySize,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant DesignGridDesignGridDisplaySizeScope oldWidget) {
    return oldWidget.displaySize != displaySize;
  }
}
