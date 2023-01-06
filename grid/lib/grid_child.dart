import 'package:flutter/widgets.dart';
import 'package:grid/display_size.dart';
import 'package:grid/grid_data.dart';

class GridChild extends StatelessWidget {
  final int smallColumns;
  final int? mediumColumns;
  final int? largeColumns;
  final int? extraLargeColumns;

  final Widget child;

  const GridChild({
    super.key,
    required this.smallColumns,
    this.mediumColumns,
    this.largeColumns,
    this.extraLargeColumns,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final data = GridData.of(context);

    var columns = getColumns(data.displaySize);

    columns = columns > data.columns ? data.columns : columns;

    final width = columns * data.columnWidth + (columns - 1) * data.columnSpacing;

    if (width <= 0) {
      return const SizedBox();
    }

    return SizedBox(
      width: width,
      child: child,
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
