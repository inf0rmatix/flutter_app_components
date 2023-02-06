import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class ExampleForm extends StatefulWidget {
  final bool useOuterPadding;

  final bool gridConstraintsChanged;

  const ExampleForm({
    super.key,
    this.useOuterPadding = true,
    this.gridConstraintsChanged = false,
  });

  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  String? salutation;

  bool showSecondName = false;

  @override
  Widget build(BuildContext context) {
    return DesignGrid(
      useOuterPadding: widget.useOuterPadding,
      shouldCalculateLayout: widget.gridConstraintsChanged,
      children: [
        DesignGridRow(
          children: [
            const DesignGridItem(
              columns: DesignGridColumns(small: 12),
              child: Text('Personal data'),
            ),
            DesignGridItem(
              columns: const DesignGridColumns(
                small: 12,
                medium: 6,
                large: 4,
                extraLarge: 3,
              ),
              child: FormField<String>(
                key: const Key('salutation'),
                builder: (state) => Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        value: 'Mr',
                        title: const Text('Mr'),
                        groupValue: salutation,
                        onChanged: onSalutationChanged,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        value: 'Mrs',
                        title: const Text('Mrs'),
                        groupValue: salutation,
                        onChanged: onSalutationChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        DesignGridRow(
          children: [
            DesignGridItem(
              columns: const DesignGridColumns(
                small: 12,
                medium: 6,
                large: 4,
                extraLarge: 3,
              ),
              child: TextFormField(
                key: const Key('firstName'),
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            if (showSecondName)
              DesignGridItem(
                columns: const DesignGridColumns(
                  small: 12,
                  medium: 6,
                  large: 4,
                  extraLarge: 3,
                ),
                child: TextFormField(
                  key: const Key('secondName'),
                  decoration: const InputDecoration(
                    labelText: 'Second Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            DesignGridItem(
              columns: const DesignGridColumns(
                small: 12,
                medium: 6,
                large: 4,
                extraLarge: 3,
              ),
              child: TextFormField(
                key: const Key('lastName'),
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        DesignGridRow(
          children: [
            const DesignGridItem(
              columns: DesignGridColumns(small: 12),
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text('Contact data'),
              ),
            ),
            DesignGridItem(
              columns: const DesignGridColumns(
                small: 12,
                medium: 6,
                large: 4,
                extraLarge: 3,
              ),
              child: TextFormField(
                key: const Key('email'),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            DesignGridItem(
              columns: const DesignGridColumns(
                small: 12,
                medium: 6,
                large: 4,
                extraLarge: 3,
              ),
              child: TextFormField(
                key: const Key('phone'),
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            DesignGridItem(
              columns: const DesignGridColumns(
                small: 12,
                medium: 6,
                large: 4,
                extraLarge: 3,
              ),
              child: ElevatedButton(
                child: const Text('Add second name'),
                onPressed: () {
                  setState(() {
                    showSecondName = !showSecondName;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onSalutationChanged(String? salutation) {
    setState(() {
      this.salutation = salutation;
    });
  }
}
