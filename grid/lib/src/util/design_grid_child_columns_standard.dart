import 'package:design_grid/design_grid.dart';

/// A standard set of column sizes for the standard breakpoints
class DesignGridChildColumnsStandard extends DesignGridChildColumns {
  final int small;
  final int? medium;
  final int? large;
  final int? extraLarge;

  const DesignGridChildColumnsStandard({
    required this.small,
    this.medium,
    this.large,
    this.extraLarge,
  });

  @override
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
