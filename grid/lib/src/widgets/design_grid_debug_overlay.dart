import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class DesignGridDebugOverlay extends StatelessWidget {
  final Color? color;

  final Widget child;

  final bool isVisible;

  final bool isInBackground;

  const DesignGridDebugOverlay({
    super.key,
    this.color,
    this.isVisible = true,
    this.isInBackground = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? const Color.fromARGB(255, 255, 0, 255);

    final transparentColor = color.withAlpha(30);

    final designGridTheme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    return Stack(
      children: [
        if (!isInBackground) child,
        if (isVisible)
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
        if (isInBackground) child,
      ],
    );
  }
}
