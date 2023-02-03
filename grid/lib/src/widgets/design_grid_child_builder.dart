import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

/// Just like the [DesignGridChild] widget, but with a builder instead of a child.
/// This is useful if you need the width of the child, or the number of columns it currently occupies.
class DesignGridChildBuilder extends DesignGridChildWidget {
  final Widget Function(BuildContext context, int columns, double width) builder;

  const DesignGridChildBuilder({
    super.key,
    required super.columns,
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
