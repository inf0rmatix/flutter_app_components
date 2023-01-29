import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_display_size_scope.dart';
import 'package:flutter/widgets.dart';

class DesignGridDisplaySize extends StatelessWidget {
  /// Use this property to override the display size.
  final DisplaySize? displaySize;

  final Widget child;

  const DesignGridDisplaySize({
    super.key,
    this.displaySize,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    late final DisplaySize displaySize;

    if (this.displaySize == null) {
      final size = MediaQuery.of(context).size;

      final width = size.width;

      displaySize = DisplaySize.fromWidth(width);
    } else {
      displaySize = this.displaySize!;
    }

    return DesignGridDisplaySizeScope(
      displaySize: displaySize,
      child: child,
    );
  }

  static DisplaySize of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<DesignGridDisplaySizeScope>();

    return scope!.displaySize;
  }
}
