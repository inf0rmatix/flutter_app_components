import 'package:design_grid/src/design_grid_display_size.dart';
import 'package:flutter/widgets.dart';

import 'design_grid_theme_data.dart';

class DesignGridTheme extends InheritedWidget {
  final DesignGridThemeData data;

  DesignGridTheme({
    super.key,
    required this.data,
    required Widget child,
  }) : super(
          child: DesignGridDisplaySize(child: child),
        );

  @override
  bool updateShouldNotify(covariant DesignGridTheme oldWidget) {
    return data != oldWidget.data;
  }

  static DesignGridThemeData of(BuildContext context) {
    final theme = maybeOf(context);

    assert(theme != null, 'No DesignGridTheme found in context');

    return theme!;
  }

  static DesignGridThemeData? maybeOf(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<DesignGridTheme>();

    return theme?.data;
  }
}
