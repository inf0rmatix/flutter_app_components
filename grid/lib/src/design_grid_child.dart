import 'package:design_grid/src/design_grid_child_data.dart';
import 'package:flutter/widgets.dart';

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
    final childData = DesignGridChildData.of(context);

    return SizedBox(
      width: childData.width,
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
