import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class GridChildLabel extends StatelessWidget {
  final Color color;

  const GridChildLabel({
    super.key,
    this.color = Colors.teal,
  });

  @override
  Widget build(BuildContext context) {
    final gridTheme = DesignGridTheme.of(context);
    final gridChildData = DesignGridItemData.of(context);
    final columns = gridChildData.columns;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          '$columns / ${gridTheme.columns}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
