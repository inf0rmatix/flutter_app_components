import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class GridChildLabel extends StatelessWidget {
  const GridChildLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final gridTheme = ResponsiveDesignGridTheme.of(context);
    final gridChildData = ResponsiveDesignGridItemData.of(context);
    final columns = gridChildData.columns;

    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          '$columns / ${gridTheme.columns}',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
