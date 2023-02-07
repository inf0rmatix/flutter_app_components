// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

/// A widget that represents a child of a [MaterialDesignGrid] widget.
class DesignGridItem extends DesignGridItemWidget {
  final Widget child;

  const DesignGridItem({
    super.key,
    required super.columns,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final childData = ResponsiveDesignGridItemData.of(context);

    return SizedBox(
      width: childData.width,
      child: child,
    );
  }
}
