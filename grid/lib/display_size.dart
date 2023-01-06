enum DisplaySize {
  small(375),
  medium(768),
  large(1280),
  extraLarge(1920);

  final double maxWidth;

  const DisplaySize(this.maxWidth);

  static DisplaySize fromWidth(double width) {
    if (small.maxWidth > width) {
      return small;
    }

    if (medium.maxWidth > width) {
      return medium;
    }

    if (large.maxWidth > width) {
      return large;
    }

    return extraLarge;
  }
}
