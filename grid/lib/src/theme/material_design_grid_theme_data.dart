class MaterialDesignGridThemeData {
  /// The spacing between columns.
  final double columnSpacing;

  /// The spacing between rows.
  final double rowSpacing;

  /// The padding on the left and right of [DesignGrid] widgets. Nested [DesignGrid] widgets will not use this padding by default.
  final double gridPadding;

  MaterialDesignGridThemeData({
    this.columnSpacing = 16.0,
    this.rowSpacing = 16.0,
    this.gridPadding = 16.0,
  })  : assert(gridPadding % 1 == 0, 'The grid padding must not have a fractional part'),
        assert(columnSpacing % 1 == 0, 'The column spacing must not have a fractional part'),
        assert(rowSpacing % 1 == 0, 'The row spacing must not have a fractional part');
}
