import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_column_sizes.dart';
import 'package:flutter/widgets.dart';

class MaterialDesignGrid extends StatelessWidget {
  final DesignGridAlignment alignment;

  final List<MaterialDesignGridRow> children;

  const MaterialDesignGrid({
    super.key,
    this.alignment = DesignGridAlignment.start,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    // Avoid using LayoutBuilder if possible, because it will rebuild the whole grid on every change and is bad for performance.
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.biggest.width;

        final theme = MaterialDesignGridTheme.maybeOf(context) ?? const MaterialDesignGridThemeData();

        final breakpoints = theme.breakpoints;

        final columns = breakpoints.getColumns(width);

        final margin = breakpoints.getMargin(width);

        var bodyWidth = breakpoints.getBodyWidth(width);

        final availableWidth = bodyWidth ?? (width - (margin ?? 0) * 2);

        final columnSizes = DesignGridCalculator.calculateColumnSizes(availableWidth, columns, theme.columnSpacing);

        bodyWidth = bodyWidth ?? availableWidth;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: margin ?? 0),
          child: DesignGridColumnSizes(
            sizes: columnSizes,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: bodyWidth,
                child: Column(
                  crossAxisAlignment: alignment.toCrossAxisAlignment(),
                  children: children
                      .expand((child) => [
                            child,
                            if (children.last != child)
                              SizedBox(
                                height: theme.rowSpacing,
                              ),
                          ])
                      .toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
