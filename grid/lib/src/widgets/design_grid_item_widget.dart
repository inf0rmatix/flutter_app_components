import 'package:design_grid/src/util/design_grid_columns.dart';
import 'package:flutter/widgets.dart';

/// A widget that represents a child of a [DesignGrid] widget. This is an abstract class, so you should use either [DesignGridChild] or [DesignGridChildBuilder].
/// For custom widgets, you can extend this class.
abstract class DesignGridItemWidget extends StatelessWidget {
  /// Specify the number of columns this child should occupy for each breakpoint.
  final DesignGridColumns columns;

  const DesignGridItemWidget({
    super.key,
    required this.columns,
  });
}
