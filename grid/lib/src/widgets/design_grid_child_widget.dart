import 'package:design_grid/src/util/design_grid_child_columns.dart';
import 'package:flutter/widgets.dart';

abstract class DesignGridChildWidget extends StatelessWidget {
  final DesignGridChildColumns columns;

  const DesignGridChildWidget({
    super.key,
    required this.columns,
  });
}
