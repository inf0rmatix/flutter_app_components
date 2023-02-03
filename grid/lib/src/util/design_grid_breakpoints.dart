import 'package:design_grid/design_grid.dart';

class DesignGridBreakpoints {
  final double small;
  final double medium;
  final double large;
  final double extraLarge;

  const DesignGridBreakpoints({
    this.small = 375,
    this.medium = 768,
    this.large = 1280,
    this.extraLarge = 1920,
  });

  DesignGridDisplaySize getDisplaySize(double width) {
    if (medium > width) {
      return DesignGridDisplaySize.small;
    }

    if (large > width) {
      return DesignGridDisplaySize.medium;
    }

    if (extraLarge > width) {
      return DesignGridDisplaySize.large;
    }

    return DesignGridDisplaySize.extraLarge;
  }
}
