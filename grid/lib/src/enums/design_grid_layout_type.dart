enum DesignGridLayoutType {
  /// [DesignGrid] will layout the children within a [Wrap] widget. This is the default.
  wrap,

  /// [DesignGrid] will layout the children within a [Row] widget. Note that this will not wrap the children and will throw errors if the children try to overflow the [DesignGrid].
  row;
}
