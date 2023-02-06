import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class DesignGridLayoutBuilder extends StatelessWidget {
  final DesignGridAlignment alignment;

  final List<Widget> children;

  const DesignGridLayoutBuilder({
    super.key,
    required this.alignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    return Wrap(
      alignment: alignment.toWrapAlignment(),
      spacing: theme.columnSpacing,
      runSpacing: theme.rowSpacing,
      children: children,
    );
  }
}
