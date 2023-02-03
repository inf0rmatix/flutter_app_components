enum DesignGridDisplaySize {
  small(375),
  medium(768),
  large(1280),
  extraLarge(1920);

  final double maxWidth;

  const DesignGridDisplaySize(this.maxWidth);

  static DesignGridDisplaySize fromWidth(double width) {
    if (medium.maxWidth > width) {
      return small;
    }

    if (large.maxWidth > width) {
      return medium;
    }

    if (extraLarge.maxWidth > width) {
      return large;
    }

    return extraLarge;
  }
}
