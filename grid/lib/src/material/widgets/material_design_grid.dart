import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/design_grid_column_sizes.dart';
import 'package:flutter/widgets.dart';

/// To implement a design system with a column-grid, you can use this widget.
///
/// To get started, you need to wrap your home widget or router with the [ResponsiveDesignGridConfig] widget.
///
/// This widget will use the [ResponsiveDesignGridDisplaySizeConfig] to provide the current [ResponsiveDesignGridDisplaySize] to all children.
///
/// To adjust the number of columns, column-spacing and the grid's outer padding, use [ResponsiveDesignGridConfig.theme].
///
/// To adjust the display size, use [ResponsiveDesignGridConfig.displaySize], this is not recommended for production since it completely overrides the display size.
///
/// The [MaterialDesignGrid] widget will calculate the layout based on the current [ResponsiveDesignGridDisplaySize] and the [ResponsiveDesignGridTheme].
/// You can use the [DesignGridItem] widget to define the number of columns for a child, depending on the display size.
///
/// Alternatively you can use multiple [MaterialDesignGrid] in a [Column] or [ListView]. This will also greatly improve performance in [ListView].
///
/// Nesting grids is possible by using the [MaterialDesignGrid] widget inside a [DesignGridItem].
///
/// The [MaterialDesignGrid] widget will automatically calculate the layout, if it is the top most grid.
/// If you use the [MaterialDesignGrid] inside a child but the [MaterialDesignGrid] itself doesn't get the full width, i.e. inside a card or a setup with other widgets, you can set [MaterialDesignGrid.shouldCalculateLayout] to true.
///
/// Example:
/// ```dart
///class ExampleApp extends StatelessWidget {
///  const ExampleApp({super.key});
///
///  @override
///  Widget build(BuildContext context) {
///    return MaterialApp(
///      title: 'Grid Demo',
///      theme: ThemeData(
///        useMaterial3: true,
///        colorScheme: ColorScheme.fromSeed(
///          seedColor: Colors.teal,
///          brightness: Brightness.dark,
///        ),
///      ),
///      // The DesignGridConfig should be the top most widget.
///      home: DesignGridConfig(
///        child: Scaffold(
///          body: DesignGrid(
///            // You can specify the alignment of the grid, default is start.
///            alignment: DesignGridAlignment.center,
///            children: [
///              // This will wrap its children if necessary.
///              // If you want to enforce a break, use another DesignGridRow.
///              // For special use-cases you can also use DesignGridItemBreak to force a break.
///              DesignGridRow(
///                // You can specify the alignment of the row, default is start.
///                alignment: DesignGridRowAlignment.center,
///                children: [
///                  DesignGridItem(
///                    // Specify the number of columns for each display size.
///                    // Small is always required, all others will be inherited in order with the breakpoints:
///                    // small, medium, large, extraLarge
///                    columns: const DesignGridColumns(small: 12),
///                    // The child will be constrained in width according to the number of columns.
///                    child: Container(
///                      padding: const EdgeInsets.all(16),
///                      color: Colors.grey,
///                      child: const Text('I span 12 columns'),
///                    ),
///                  ),
///                  DesignGridItem(
///                    columns: const DesignGridColumns(small: 6),
///                    child: Container(
///                      padding: const EdgeInsets.all(16),
///                      color: Colors.grey,
///                      child: const Text('I span 6 columns'),
///                    ),
///                  ),
///                ],
///              ),
///              DesignGridRow(
///                children: [
///                  DesignGridItem(
///                    columns: const DesignGridColumns(
///                      small: 8,
///                      large: 4,
///                    ),
///                    child: Container(
///                      padding: const EdgeInsets.all(16),
///                      color: Colors.grey,
///                      child: const Text('I span 8 columns on small screens and 4 on large screens'),
///                    ),
///                  ),
///                ],
///              ),
///            ],
///          ),
///        ),
///      ),
///    );
///  }
///}
/// ```
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

        final columns = MaterialDesignGridBreakpoints.getColumns(width);

        final margin = MaterialDesignGridBreakpoints.getMargin(width);

        final bodyWidth = MaterialDesignGridBreakpoints.getBodyWidth(width);

        final availableWidth = bodyWidth ?? (width - (margin ?? 0) * 2);

        final columnSizes = DesignGridCalculator.calculateColumnSizes(availableWidth, columns, theme.columnSpacing);

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
