import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class DesignGridLayoutBuilder extends StatelessWidget {
  final DesignGridAlignment alignment;

  final List<List<Widget>> rows;

  const DesignGridLayoutBuilder({
    super.key,
    required this.alignment,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty || rows.length == 1 && rows.first.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = DesignGridTheme.maybeOf(context) ?? const DesignGridThemeData();

    final mainAxisAlignment = alignment.toMainAxisAlignment();

    if (rows.length == 1) {
      final row = rows.first;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment,
        children: row
            .expand((child) => [
                  child,
                  if (row.last != child)
                    SizedBox(
                      width: theme.columnSpacing,
                    ),
                ])
            .toList(),
      );
    }

    return Column(
      children: [
        for (final row in rows) ...[
          Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: row
                .expand((child) => [
                      child,
                      if (row.last != child)
                        SizedBox(
                          width: theme.columnSpacing,
                        ),
                    ])
                .toList(),
          ),
          if (row != rows.last)
            SizedBox(
              height: theme.rowSpacing,
            ),
        ]
      ],
    );
  }
}
