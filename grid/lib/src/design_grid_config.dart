import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_display_size.dart';
import 'package:flutter/widgets.dart';

/// A widget that configures the [DesignGrid] widget. Provides [DesignGridTheme] and [DesignGridDisplaySize] to the [DesignGrid] widget.
class DesignGridConfig extends StatelessWidget {
  final DesignGridThemeData theme;

  /// Optional override for the [DesignGridDisplaySize] widget.
  final DisplaySize? displaySize;

  final Widget child;

  const DesignGridConfig({
    super.key,
    this.theme = const DesignGridThemeData(),
    this.displaySize,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DesignGridDisplaySize(
      displaySize: displaySize,
      child: DesignGridTheme(
        data: theme,
        child: child,
      ),
    );
  }
}
