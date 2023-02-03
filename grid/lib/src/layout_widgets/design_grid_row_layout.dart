import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class DesignGridRowLayout extends StatelessWidget {
  final DesignGridAlignment alignment;

  final List<Widget> children;

  const DesignGridRowLayout({
    super.key,
    required this.alignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    return Row(
      mainAxisAlignment: alignment.toMainAxisAlignment(),
      children: children
          .expand((child) => [
                child,
                if (children.last != child) SizedBox(width: theme.columnSpacing),
              ])
          .toList(),
    );
  }
}
