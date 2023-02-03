import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/display_size/design_grid_display_size_scope.dart';
import 'package:flutter/widgets.dart';

class DesignGridDisplaySizeConfig extends StatelessWidget {
  /// Use this property to override the display size.
  final DesignGridDisplaySize? displaySize;

  /// If you want to override the default breakpoints, you can pass them in here.
  final DesignGridBreakpoints breakpoints;

  final Widget child;

  const DesignGridDisplaySizeConfig({
    super.key,
    this.displaySize,
    this.breakpoints = const DesignGridBreakpoints(),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    late final DesignGridDisplaySize displaySize;

    if (this.displaySize == null) {
      final size = MediaQuery.of(context).size;

      final width = size.width;

      displaySize = breakpoints.getDisplaySize(width);
    } else {
      displaySize = this.displaySize!;
    }

    return DesignGridDesignGridDisplaySizeScope(
      displaySize: displaySize,
      child: child,
    );
  }

  static DesignGridDisplaySize of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<DesignGridDesignGridDisplaySizeScope>();

    return scope!.displaySize;
  }
}
