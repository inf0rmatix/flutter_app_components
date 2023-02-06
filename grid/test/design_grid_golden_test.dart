import 'package:alchemist/alchemist.dart';
import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid', () {
    const testDesignGridThemeData = DesignGridThemeData(
      gridPadding: 16.0,
      columnSpacing: 16.0,
      rowSpacing: 16.0,
      columns: 12,
    );

    const breakpoints = DesignGridBreakpoints();

    final breakpointScenarios = <DesignGridDisplaySize, double>{
      DesignGridDisplaySize.small: breakpoints.small,
      DesignGridDisplaySize.medium: breakpoints.medium,
      DesignGridDisplaySize.large: breakpoints.large,
      DesignGridDisplaySize.extraLarge: breakpoints.extraLarge,
    };

    goldenTest(
      'should do a basic column layout for all sizes',
      fileName: 'design_grid_basic_column_layout',
      constraints: BoxConstraints(maxWidth: breakpoints.extraLarge),
      builder: () {
        return DesignGridConfig(
          theme: testDesignGridThemeData,
          child: Wrap(
            children: [
              for (final scenario in breakpointScenarios.entries)
                GoldenTestScenario(
                  name: scenario.key.name,
                  child: _DesignGridForTest(width: scenario.value),
                ),
            ],
          ),
        );
      },
    );

    goldenTest(
      'should use breaks',
      fileName: 'design_grid_breaks',
      constraints: BoxConstraints(maxWidth: breakpoints.extraLarge),
      builder: () {
        return DesignGridConfig(
          child: DesignGrid(
            children: [
              DesignGridRow(
                children: [
                  DesignGridItem(
                    columns: const DesignGridChildColumns(small: 6),
                    child: _GridChildLabel(),
                  ),
                  const DesignGridItemBreak(),
                  DesignGridItem(
                    columns: const DesignGridChildColumns(small: 6),
                    child: _GridChildLabel(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    goldenTest(
      'should work with nested design grids',
      fileName: 'design_grid_nested_design_grid',
      constraints: BoxConstraints(maxWidth: breakpoints.extraLarge),
      builder: () {
        return GoldenTestScenario(
          name: 'nested design grid',
          child: MediaQuery(
            data: const MediaQueryData(size: Size(1540, 1080)),
            child: DesignGridConfig(
              theme: testDesignGridThemeData,
              child: DesignGrid(
                children: [
                  DesignGridRow(
                    children: [
                      DesignGridItem(
                        columns: const DesignGridChildColumns(small: 12),
                        child: Container(
                          color: Colors.black26,
                          child: Wrap(
                            runSpacing: 16.0,
                            children: [
                              _GridChildLabel(),
                              DesignGrid(
                                children: [
                                  DesignGridRow(
                                    children: [
                                      DesignGridItem(
                                        columns: const DesignGridChildColumns(small: 6),
                                        child: Container(
                                          color: Colors.black26,
                                          child: Wrap(
                                            runSpacing: 16.0,
                                            children: [
                                              _GridChildLabel(),
                                              DesignGrid(
                                                children: [
                                                  DesignGridRow(
                                                    children: [
                                                      DesignGridItem(
                                                        columns: const DesignGridChildColumns(small: 4),
                                                        child: Container(
                                                          color: Colors.black26,
                                                          child: Wrap(
                                                            runSpacing: 16.0,
                                                            children: [
                                                              _GridChildLabel(),
                                                              DesignGrid(
                                                                children: [
                                                                  DesignGridRow(
                                                                    children: [
                                                                      DesignGridItem(
                                                                        columns: const DesignGridChildColumns(small: 6),
                                                                        child: Column(
                                                                          children: [
                                                                            _GridChildLabel(),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      DesignGridItem(
                                                                        columns: const DesignGridChildColumns(small: 6),
                                                                        child: _GridChildLabel(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      DesignGridItem(
                                                        columns: const DesignGridChildColumns(small: 8),
                                                        child: _GridChildLabel(),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      DesignGridItem(
                                        columns: const DesignGridChildColumns(small: 6),
                                        child: _GridChildLabel(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    goldenTest(
      'should work for a known edge-case of 1540px',
      fileName: 'design_grid_1540px',
      builder: () => GoldenTestScenario(
        name: 'edge case width of 1540px',
        child: const DesignGridConfig(
          theme: testDesignGridThemeData,
          child: _DesignGridForTest(width: 1540),
        ),
      ),
    );
  });
}

class _DesignGridForTest extends StatelessWidget {
  final double width;

  const _DesignGridForTest({
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    const columnSizeExamples = [12, 6, 4, 3, 2, 1];

    return MediaQuery(
      data: MediaQueryData(size: Size(width, 1080)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: DesignGrid(
          children: [
            for (final columns in columnSizeExamples)
              DesignGridRow(
                children: [
                  ...List.generate(
                    12 ~/ columns,
                    (_) => DesignGridItem(
                      columns: DesignGridChildColumns(small: columns),
                      child: _GridChildLabel(),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _GridChildLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gridChildData = DesignGridChildData.of(context);
    final columns = gridChildData.columns;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          '$columns / 12',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
