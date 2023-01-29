import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_display_size_scope.dart';
import 'package:flutter/widgets.dart';

class DesignGridDisplaySize extends StatelessWidget {
  final Widget child;

  const DesignGridDisplaySize({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;

    final displaySize = DisplaySize.fromWidth(width);

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
