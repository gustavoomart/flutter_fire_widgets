<h1 align="center">🔥 FIRE WIDGETS EXAMPLES 🔥</h1>

<details>
<summary><h1>ExpandableBottomSheetPage</h1></summary>

```dart
import 'package:flutter/material.dart';
import 'package:fire_widgets/fire_widgets.dart';

void main() {
  runApp(const ExpandableBottomSheetAppExample());
}

class ExpandableBottomSheetAppExample extends StatelessWidget {
  const ExpandableBottomSheetAppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire widgets demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
          contrastLevel: 0,
        ),
        useMaterial3: true,
      ),
      home: const ExpandableBottomSheetPageExample(
        title: '🔥 Expandable Bottom Sheet Example 🔥',
      ),
    );
  }
}

class ExpandableBottomSheetPageExample extends StatelessWidget {
  const ExpandableBottomSheetPageExample({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ExpandableBottomSheetPage(
        arrowIcon: Icons.keyboard_arrow_up,
        animationDuration: 400,
        animationCurve: Curves.bounceInOut,
        headerHeightPercentage: 0.05,
        openedHeightPercentage: 0.5,
        arrowRightMargin: 8,
        arrowColor: Theme.of(context).colorScheme.onPrimary,
        arrowSize: 24,
        headerDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        body: Center(
          child: Text(
            'This is the main content of the page',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        header: Center(
          child: Text(
            'THIS IS THE HEADER',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        bottomSheetBody: Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '🔥 This is the sheet body $index',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

```
</details>

<details>
<summary><h1>ThemeColorsViewerPage</h1></summary>

```dart
import 'package:flutter/material.dart';
import 'package:fire_widgets/fire_widgets.dart';

void main() {
  runApp(const ThemeViewerApp());
}

class ThemeViewerApp extends StatelessWidget {
  const ThemeViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🔥 Fire Widgets demo 🔥',
      // Modify all ThemeData properties here and see them in real time in the running app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
          contrastLevel: 0,
        ),
        useMaterial3: true,
      ),

      home: const ThemeColorsViewerPage(),
    );
  }
}


```
</details>