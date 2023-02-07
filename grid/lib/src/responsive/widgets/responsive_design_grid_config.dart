import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

/// A widget that configures the [MaterialDesignGrid] widget by wrapping hte [child] in [ResponsiveDesignGridTheme] and [ResponsiveDesignGridDisplaySizeConfig].
class ResponsiveDesignGridConfig extends StatelessWidget {
  final ResponsiveDesignGridThemeData theme;

  /// Optional override for the [ResponsiveDesignGridDisplaySizeConfig] widget. Useful for testing.
  final ResponsiveDesignGridDisplaySize? displaySize;

  /// If you want to override the default breakpoints, you can pass them in here.
  final ResponsiveDesignGridBreakpoints? breakpoints;

  final Widget child;

  const ResponsiveDesignGridConfig({
    super.key,
    this.theme = const ResponsiveDesignGridThemeData(),
    this.displaySize,
    this.breakpoints,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveDesignGridDisplaySizeConfig(
      displaySize: displaySize,
      breakpoints: breakpoints ?? const ResponsiveDesignGridBreakpoints(),
      child: ResponsiveDesignGridTheme(
        data: theme,
        child: child,
      ),
    );
  }
}
