import 'package:design_grid/design_grid.dart';

/// Defines the number of columns a [ResponsiveDesignGridItem] should take up for each [ResponsiveDesignGridDisplaySize].
/// If a [ResponsiveDesignGridDisplaySize] is not specified, the value before will be used.
class ResponsiveDesignGridColumns {
  final int small;
  final int? medium;
  final int? large;
  final int? extraLarge;

  const ResponsiveDesignGridColumns({
    required this.small,
    this.medium,
    this.large,
    this.extraLarge,
  });

  int getColumns(ResponsiveDesignGridDisplaySize displaySize) {
    switch (displaySize) {
      case ResponsiveDesignGridDisplaySize.small:
        return small;
      case ResponsiveDesignGridDisplaySize.medium:
        return medium ?? small;
      case ResponsiveDesignGridDisplaySize.large:
        return large ?? medium ?? small;
      case ResponsiveDesignGridDisplaySize.extraLarge:
        return extraLarge ?? large ?? medium ?? small;
    }
  }
}
