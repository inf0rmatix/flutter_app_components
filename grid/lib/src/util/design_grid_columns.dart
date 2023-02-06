import 'package:design_grid/design_grid.dart';

/// Defines the number of columns a [DesignGridItem] should take up for each [DesignGridDisplaySize].
/// If a [DesignGridDisplaySize] is not specified, the value before will be used.
class DesignGridColumns {
  final int small;
  final int? medium;
  final int? large;
  final int? extraLarge;

  const DesignGridColumns({
    required this.small,
    this.medium,
    this.large,
    this.extraLarge,
  });

  int getColumns(DesignGridDisplaySize displaySize) {
    switch (displaySize) {
      case DesignGridDisplaySize.small:
        return small;
      case DesignGridDisplaySize.medium:
        return medium ?? small;
      case DesignGridDisplaySize.large:
        return large ?? medium ?? small;
      case DesignGridDisplaySize.extraLarge:
        return extraLarge ?? large ?? medium ?? small;
    }
  }
}
