import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

/// A widget that configures the [DesignGrid] widget by wrapping hte [child] in [DesignGridTheme] and [DesignGridDisplaySizeConfig].
class DesignGridConfig extends StatelessWidget {
  final DesignGridThemeData theme;

  /// Optional override for the [DesignGridDisplaySizeConfig] widget. Useful for testing.
  final DesignGridDisplaySize? displaySize;

  /// If you want to override the default breakpoints, you can pass them in here.
  final DesignGridBreakpoints? breakpoints;

  final Widget child;

  const DesignGridConfig({
    super.key,
    this.theme = const DesignGridThemeData(),
    this.displaySize,
    this.breakpoints,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DesignGridDisplaySizeConfig(
      displaySize: displaySize,
      breakpoints: breakpoints ?? const DesignGridBreakpoints(),
      child: DesignGridTheme(
        data: theme,
        child: child,
      ),
    );
  }
}
