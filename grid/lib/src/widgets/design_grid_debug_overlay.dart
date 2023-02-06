import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class DesignGridDebugOverlay extends StatefulWidget {
  final Color? color;

  final Widget child;

  final bool isVisible;

  final bool enableControls;

  final bool isInBackground;

  final bool useOuterPadding;

  final bool? shouldCalculateLayout;

  const DesignGridDebugOverlay({
    super.key,
    this.color,
    this.isVisible = true,
    this.enableControls = true,
    this.isInBackground = false,
    this.useOuterPadding = true,
    this.shouldCalculateLayout,
    required this.child,
  });

  @override
  State<DesignGridDebugOverlay> createState() => _DesignGridDebugOverlayState();
}

class _DesignGridDebugOverlayState extends State<DesignGridDebugOverlay> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    _isVisible = widget.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? const Color.fromARGB(255, 255, 0, 255);

    final transparentColor = color.withAlpha(30);

    final designGridTheme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    return Stack(
      children: [
        if (!widget.isInBackground) widget.child,
        if (_isVisible)
          Positioned.fill(
            child: IgnorePointer(
              child: LayoutBuilder(builder: (context, constraints) {
                return DesignGrid(
                  shouldCalculateLayout: widget.shouldCalculateLayout,
                  useOuterPadding: widget.useOuterPadding,
                  children: [
                    DesignGridRow(
                      children: List.generate(
                        designGridTheme.columns,
                        (_) => DesignGridItem(
                          columns: const DesignGridColumns(small: 1),
                          child: Container(
                            width: double.infinity,
                            height: constraints.biggest.height,
                            color: transparentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        if (widget.isInBackground) widget.child,
        if (widget.enableControls)
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              child: Icon(_isVisible ? Icons.view_column_outlined : Icons.view_column),
              onPressed: () => setState(() => _isVisible = !_isVisible),
            ),
          ),
      ],
    );
  }
}
