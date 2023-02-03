import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

abstract class DesignGridChildWidget extends StatelessWidget {
  final int smallColumns;
  final int? mediumColumns;
  final int? largeColumns;
  final int? extraLargeColumns;

  const DesignGridChildWidget({
    super.key,
    required this.smallColumns,
    this.mediumColumns,
    this.largeColumns,
    this.extraLargeColumns,
  });

  int getColumns(DesignGridDisplaySize displaySize) {
    switch (displaySize) {
      case DesignGridDisplaySize.small:
        return smallColumns;
      case DesignGridDisplaySize.medium:
        return mediumColumns ?? smallColumns;
      case DesignGridDisplaySize.large:
        return largeColumns ?? mediumColumns ?? smallColumns;
      case DesignGridDisplaySize.extraLarge:
        return extraLargeColumns ?? largeColumns ?? mediumColumns ?? smallColumns;
    }
  }
}
