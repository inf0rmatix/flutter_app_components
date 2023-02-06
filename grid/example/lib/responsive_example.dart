import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignGrid(
      children: [
        DesignGridRow(
          children: [
            DesignGridItem(
              columns: const DesignGridColumns(
                small: 0,
                medium: 2,
                large: 4,
              ),
              child: Container(
                height: double.infinity,
                color: Theme.of(context).cardColor,
                child: DesignGrid(
                  children: [
                    DesignGridRow(
                      alignment: DesignGridAlignment.center,
                      children: [
                        DesignGridItem(
                          columns: const DesignGridColumns(small: 8),
                          child: Container(
                            height: 256,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            DesignGridItem(
              columns: const DesignGridColumns(
                small: 12,
                medium: 10,
                large: 8,
              ),
              child: Container(
                height: double.infinity,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
