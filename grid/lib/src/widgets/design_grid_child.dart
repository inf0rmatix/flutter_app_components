// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_grid/src/util/design_grid_child_data.dart';
import 'package:design_grid/src/widgets/design_grid_child_widget.dart';
import 'package:flutter/widgets.dart';

/// A widget that represents a child of a [DesignGrid] widget.
class DesignGridChild extends DesignGridChildWidget {
  final Widget child;

  const DesignGridChild({
    super.key,
    required super.columns,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;

    final childData = DesignGridChildData.of(context);

    return SizedBox(
      width: childData.width,
      child: child,
    );
  }
}
