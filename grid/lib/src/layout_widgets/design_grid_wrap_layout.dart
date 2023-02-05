import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class DesignGridWrapLayout extends StatelessWidget {
  final DesignGridAlignment alignment;

  final List<Widget> children;

  const DesignGridWrapLayout({
    super.key,
    required this.alignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    // TODO get rid of wrap for performance reasons
    return Wrap(
      spacing: theme.columnSpacing,
      runSpacing: theme.rowSpacing,
      alignment: alignment.toWrapAlignment(),
      children: children,
    );
  }
}
