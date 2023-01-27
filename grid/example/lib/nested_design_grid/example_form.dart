import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class ExampleForm extends StatefulWidget {
  const ExampleForm({super.key});

  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  String? salutation;

  @override
  Widget build(BuildContext context) {
    return DesignGrid(
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
          child: Text('Contact data'),
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
