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

  @override
  Widget build(BuildContext context) {
    return DesignGrid(
      useOuterPadding: widget.useOuterPadding,
      shouldCalculateLayout: widget.gridConstraintsChanged,
      children: [
        const DesignGridChild(
          smallColumns: 12,
          child: Text('Personal data'),
        ),
        DesignGridChild(
          smallColumns: 12,
          mediumColumns: 6,
          largeColumns: 4,
          extraLargeColumns: 3,
          child: FormField<String>(
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
        const DesignGridChildBreak(),
        DesignGridChild(
          smallColumns: 12,
          mediumColumns: 6,
          largeColumns: 4,
          extraLargeColumns: 3,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'First Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        DesignGridChild(
          smallColumns: 12,
          mediumColumns: 6,
          largeColumns: 4,
          extraLargeColumns: 3,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Second Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        DesignGridChild(
          smallColumns: 12,
          mediumColumns: 6,
          largeColumns: 4,
          extraLargeColumns: 3,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Last Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const DesignGridChildBreak(),
        const DesignGridChild(
          smallColumns: 12,
          child: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text('Contact data'),
          ),
        ),
        DesignGridChild(
          smallColumns: 12,
          mediumColumns: 6,
          largeColumns: 4,
          extraLargeColumns: 3,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        DesignGridChild(
          smallColumns: 12,
          mediumColumns: 6,
          largeColumns: 4,
          extraLargeColumns: 3,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phone',
              border: OutlineInputBorder(),
            ),
          ),
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
