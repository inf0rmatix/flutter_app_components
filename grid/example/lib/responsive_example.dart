import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class ResponsiveExample extends StatelessWidget {
  const ResponsiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignGrid(
      layoutType: DesignGridLayoutType.row,
      children: [
        DesignGridChild(
          smallColumns: 0,
          mediumColumns: 2,
          largeColumns: 4,
          child: Container(
            height: double.infinity,
            color: Theme.of(context).cardColor,
            child: DesignGrid(
              alignment: DesignGridAlignment.center,
              children: [
                DesignGridChild(
                  smallColumns: 8,
                  child: Container(
                    height: 256,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
        DesignGridChild(
          smallColumns: 12,
          mediumColumns: 10,
          largeColumns: 8,
          child: Container(
            height: double.infinity,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}
