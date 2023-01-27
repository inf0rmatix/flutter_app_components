class DesignGridThemeData {
  static const defaultColumns = 12;

  static const defaultGridPadding = 16.0;
  static const defaultColumnSpacing = 16.0;
  static const defaultRowSpacing = defaultColumnSpacing;

  final int columns;

  final double columnSpacing;

  final double rowSpacing;

  final double gridPadding;

  // final DisplaySize displaySize;

  const DesignGridThemeData({
    int? columns,
    double? columnSpacing,
    double? rowSpacing,
    double? gridPadding,
  })  : columns = columns ?? defaultColumns,
        columnSpacing = columnSpacing ?? defaultColumnSpacing,
        rowSpacing = rowSpacing ?? defaultRowSpacing,
        gridPadding = gridPadding ?? defaultGridPadding,
        assert((columns ?? 1) > 0 || columns == null, 'The number of columns must be greater than zero'),
        assert((gridPadding ?? 1) % 1 == 0, 'The grid padding must not have a fractional part'),
        assert((columnSpacing ?? 1) % 1 == 0, 'The column spacing must not have a fractional part'),
        assert((rowSpacing ?? 1) % 1 == 0, 'The row spacing must not have a fractional part');

  @override
  bool operator ==(covariant DesignGridThemeData other) {
    if (identical(this, other)) return true;

    return other.columns == columns &&
        other.columnSpacing == columnSpacing &&
        other.rowSpacing == rowSpacing &&
        other.gridPadding == gridPadding;
  }

  @override
  int get hashCode {
    return columns.hashCode ^ columnSpacing.hashCode ^ rowSpacing.hashCode ^ gridPadding.hashCode;
  }
}
