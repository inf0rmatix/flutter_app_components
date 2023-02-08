import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

/// Use this widget if you want a line break within a [ResponsiveDesignGridRow].
class ResponsiveDesignGridItemBreak extends ResponsiveDesignGridItem {
  const ResponsiveDesignGridItemBreak({super.key})
      : super(
          child: const SizedBox(),
          columns: const _DesignGridChildColumnsBreak(),
        );
}

class _DesignGridChildColumnsBreak extends ResponsiveDesignGridColumns {
  const _DesignGridChildColumnsBreak() : super(small: 0);
}
