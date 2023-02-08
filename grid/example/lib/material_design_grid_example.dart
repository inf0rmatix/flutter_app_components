import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class MaterialDesignGridExample extends StatelessWidget {
  static const description = '''
This is a Material Design Grid. 
It is used to create a responsive layout.
This Grid changes the number of columns the horizontal space is divided into for specific breakpoints.
Its children only need to specify the number of columns they should span.
''';

  const MaterialDesignGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialDesignGridTheme(
      child: ListView(
        padding: const EdgeInsets.only(top: 8.0),
        children: [
          MaterialDesignGrid(
            children: [
              MaterialDesignGridRow(
                children: [
                  MaterialDesignGridItem(
                    columns: 4,
                    child: Card(
                      child: Column(
                        children: const [
                          ListTile(
                            title: Text('Material Design Grid'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(description),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              MaterialDesignGridRow(
                children: [
                  for (var i = 0; i < 3; i++)
                    MaterialDesignGridItem(
                      columns: 4,
                      child: Card(
                        child: Column(
                          children: const [
                            ListTile(
                              title: Text('Item'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('This is 4 columns wide'),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              MaterialDesignGridRow(
                children: [
                  for (var i = 0; i < 6; i++)
                    MaterialDesignGridItem(
                      columns: 2,
                      child: Card(
                        child: Column(
                          children: const [
                            ListTile(
                              title: Text('Item'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('This is 2 columns wide'),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
