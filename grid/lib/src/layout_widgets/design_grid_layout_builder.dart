import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/layout_widgets/design_grid_row_layout.dart';
import 'package:design_grid/src/layout_widgets/design_grid_wrap_layout.dart';
import 'package:flutter/widgets.dart';

class DesignGridLayoutBuilder extends StatelessWidget {
  final DesignGridLayoutType layoutType;

  final DesignGridAlignment alignment;

  final List<Widget> children;

  const DesignGridLayoutBuilder({
    super.key,
    required this.layoutType,
    required this.alignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    switch (layoutType) {
      case DesignGridLayoutType.wrap:
        return DesignGridWrapLayout(
          alignment: alignment,
          children: children,
        );
      case DesignGridLayoutType.row:
        return DesignGridRowLayout(
          alignment: alignment,
          children: children,
        );
    }
  }
}
