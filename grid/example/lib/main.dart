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
//       home: ResponsiveDesignGridConfig(
//         child: Scaffold(
//           body: ResponsiveDesignGrid(
//             // You can specify the alignment of the grid, default is start.
//             alignment: DesignGridAlignment.center,
//             children: [
//               // This will wrap its children if necessary.
//               // If you want to enforce a break, use another DesignGridRow.
//               // For special use-cases you can also use DesignGridItemBreak to force a break.
//               ResponsiveDesignGridRow(
//                 // You can specify the alignment of the row, default is start.
//                 alignment: DesignGridRowAlignment.center,
//                 children: [
//                   ResponsiveDesignGridItem(
//                     // Specify the number of columns for each display size.
//                     // Small is always required, all others will be inherited in order with the breakpoints:
//                     // small, medium, large, extraLarge
//                     columns: const ResponsiveDesignGridColumns(small: 12),
//                     // The child will be constrained in width according to the number of columns.
//                     child: Container(
//                       padding: const EdgeInsets.all(16),
//                       color: Colors.grey,
//                       child: const Text('I span 12 columns'),
//                     ),
//                   ),
//                   ResponsiveDesignGridItem(
//                     columns: const ResponsiveDesignGridColumns(small: 6),
//                     child: Container(
//                       padding: const EdgeInsets.all(16),
//                       color: Colors.grey,
//                       child: const Text('I span 6 columns'),
//                     ),
//                   ),
//                 ],
//               ),
//               ResponsiveDesignGridRow(
//                 children: [
//                   ResponsiveDesignGridItem(
//                     columns: const ResponsiveDesignGridColumns(
//                       small: 8,
//                       large: 4,
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.all(16),
//                       color: Colors.grey,
//                       child: const Text(
//                           'I span 8 columns on small screens, on medium too, and 4 on large screens and extra large screens.'),
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

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  var brightness = Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 15, 83, 117),
          brightness: brightness,
        ),
      ),
      home: ResponsiveDesignGridConfig(
        child: IntroductionPage(
          brightness: brightness,
          onBrightnessChanged: (brightness) => setState(() => this.brightness = brightness),
        ),
      ),
    );
  }
}
