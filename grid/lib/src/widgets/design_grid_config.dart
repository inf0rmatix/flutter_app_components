import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

/// A widget that configures the [DesignGrid] widget by wrapping hte [child] in [DesignGridTheme] and [DesignGridDisplaySizeConfig].
class DesignGridConfig extends StatelessWidget {
  final DesignGridThemeData theme;

  /// Optional override for the [DesignGridDisplaySizeConfig] widget. Useful for testing.
  final DesignGridDisplaySize? displaySize;

  final Widget child;

  const DesignGridConfig({
    super.key,
    this.theme = const DesignGridThemeData(),
    this.displaySize,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DesignGridDisplaySizeConfig(
      displaySize: displaySize,
      child: DesignGridTheme(
        data: theme,
        child: child,
      ),
    );
  }
}
