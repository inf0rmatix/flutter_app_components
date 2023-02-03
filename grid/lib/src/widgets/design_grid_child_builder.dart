import 'package:design_grid/src/design_grid_child_data.dart';
import 'package:design_grid/src/widgets/design_grid_child_base.dart';
import 'package:flutter/widgets.dart';

class DesignGridChildBuilder extends DesignGridChildWidget {
  final Widget Function(BuildContext context, int columns, double width) builder;

  const DesignGridChildBuilder({
    super.key,
    required super.smallColumns,
    super.mediumColumns,
    super.largeColumns,
    super.extraLargeColumns,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final childData = DesignGridChildData.of(context);

    return SizedBox(
      width: childData.width,
      child: builder(
        context,
        childData.columns,
        childData.width,
      ),
    );
  }
}
