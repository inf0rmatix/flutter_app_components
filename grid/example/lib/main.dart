import 'package:design_grid/design_grid.dart';
import 'package:example/introduction_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

// TODO this will be the package example, move the talk specific stuff
// class ExampleApp extends StatelessWidget {
//   const ExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Grid Demo',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.teal,
//           brightness: Brightness.dark,
//         ),
//       ),
//       // The DesignGridConfig should be the top most widget.
//       home: DesignGridConfig(
//         child: Scaffold(
//           body: DesignGrid(
//             // You can specify the alignment of the grid, default is start.
//             alignment: DesignGridAlignment.center,
//             children: [
//               // This will wrap its children if necessary.
//               // If you want to enforce a break, use another DesignGridRow.
//               // For special use-cases you can also use DesignGridItemBreak to force a break.
//               DesignGridRow(
//                 // You can specify the alignment of the row, default is start.
//                 alignment: DesignGridRowAlignment.center,
//                 children: [
//                   DesignGridItem(
//                     // Specify the number of columns for each display size.
//                     // Small is always required, all others will be inherited in order with the breakpoints:
//                     // small, medium, large, extraLarge
//                     columns: const DesignGridColumns(small: 12),
//                     // The child will be constrained in width according to the number of columns.
//                     child: Container(
//                       padding: const EdgeInsets.all(16),
//                       color: Colors.grey,
//                       child: const Text('I span 12 columns'),
//                     ),
//                   ),
//                   DesignGridItem(
//                     columns: const DesignGridColumns(small: 6),
//                     child: Container(
//                       padding: const EdgeInsets.all(16),
//                       color: Colors.grey,
//                       child: const Text('I span 6 columns'),
//                     ),
//                   ),
//                 ],
//               ),
//               DesignGridRow(
//                 children: [
//                   DesignGridItem(
//                     columns: const DesignGridColumns(
//                       small: 8,
//                       large: 4,
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.all(16),
//                       color: Colors.grey,
//                       child: const Text('I span 8 columns on small screens and 4 on large screens'),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 15, 83, 117),
          brightness: Brightness.dark,
        ),
      ),
      home: const ResponsiveDesignGridConfig(
        child: IntroductionPage(),
      ),
    );
  }
}
