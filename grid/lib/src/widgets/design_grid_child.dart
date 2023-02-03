import 'package:design_grid/src/design_grid_child_data.dart';
import 'package:design_grid/src/widgets/design_grid_child_widget.dart';
import 'package:flutter/widgets.dart';

class DesignGridChild extends DesignGridChildWidget {
  final Widget child;

  const DesignGridChild({
    super.key,
    required super.smallColumns,
    super.mediumColumns,
    super.largeColumns,
    super.extraLargeColumns,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final childData = DesignGridChildData.of(context);

    return SizedBox(
      width: childData.width,
      child: child,
    );
  }
}
