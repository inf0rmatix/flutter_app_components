import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class DesignGridDebugOverlay extends StatelessWidget {
  final Color? color;

  final Widget child;

  const DesignGridDebugOverlay({
    super.key,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.error;

    final transparentColor = color.withAlpha(50);

    final designGridTheme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    return Stack(
      children: [
        child,
        IgnorePointer(
          child: LayoutBuilder(builder: (context, constraints) {
            return DesignGrid(
              children: List.generate(
                designGridTheme.columns,
                (_) => DesignGridChild(
                  columns: const DesignGridChildColumns(small: 1),
                  child: Container(
                    width: double.infinity,
                    height: constraints.biggest.height,
                    color: transparentColor,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
