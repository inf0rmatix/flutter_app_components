import 'package:design_grid/design_grid_child_data.dart';
import 'package:flutter/widgets.dart';

import 'design_grid_data.dart';
import 'design_grid_theme.dart';
import 'display_size.dart';

class DesignGridChild extends StatelessWidget {
  final int smallColumns;
  final int? mediumColumns;
  final int? largeColumns;
  final int? extraLargeColumns;

  final Widget child;

  const DesignGridChild({
    super.key,
    required this.smallColumns,
    this.mediumColumns,
    this.largeColumns,
    this.extraLargeColumns,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final gridData = DesignGridData.of(context);
    final theme = DesignGridTheme.of(context);

    var columns = getColumns(gridData.displaySize);

    // TODO maybe use an assertion instead to provide more transparency to the developer
    columns = columns > theme.columns ? theme.columns : columns;

    final spacersSpanned = columns - 1;

    // TODO fix, get columns from array fitting the position
    final width = columns * gridData.columnSizes.last + spacersSpanned * theme.columnSpacing;

    if (width <= 0) {
      return const SizedBox();
    }

    return SizedBox(
      width: width,
      child: DesignGridChildData(
        columns: columns,
        child: child,
      ),
    );
  }

  int getColumns(DisplaySize displaySize) {
    switch (displaySize) {
      case DisplaySize.small:
        return smallColumns;
      case DisplaySize.medium:
        return mediumColumns ?? smallColumns;
      case DisplaySize.large:
        return largeColumns ?? mediumColumns ?? smallColumns;
      case DisplaySize.extraLarge:
        return extraLargeColumns ?? largeColumns ?? mediumColumns ?? smallColumns;
    }
  }
}
