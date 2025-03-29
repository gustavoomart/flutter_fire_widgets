<h1 align="center">🔥 FIRE WIDGETS EXAMPLES 🔥</h1>

<details>
<summary>ExpandableBottomSheetPage</summary>

This example show a full possible implementation of the expandable bottom sheet page, you don't need to set all thoes variables, in the example they are setted to the default values. Only required parameters is the body, header and bottomSheetBody:

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
      home: ExpandableBottomSheetPageExample(
        title: '🔥 EXPANDABLE BOTTOM SHEET EXAMPLE 🔥',
      ),
    );
  }
}

class ExpandableBottomSheetPageExample extends StatefulWidget {
  const ExpandableBottomSheetPageExample({super.key, required this.title});
  final String title;

  @override
  State<ExpandableBottomSheetPageExample> createState() => _ExpandableBottomSheetPageExampleState();
}

class _ExpandableBottomSheetPageExampleState extends State<ExpandableBottomSheetPageExample> {
  // This is for showcase the onEnd callback feature.
  bool _showEmoji = true;
  final Text bodyEmoji = Text(
    '🔥',
    style: TextStyle(fontSize: 60),
  );
  void _animateFireEmoji() async {
    const int repeatCount = 10;
    for (int i = 0; i < repeatCount; i++) {
      setState(() {
        _showEmoji = !_showEmoji;
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }
      setState(() {
        _showEmoji = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
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
        animationDuration: 1000,
        animationCurve: Curves.bounceOut,
        headerHeightPercentage: 0.05,
        openedHeightPercentage: 0.5,
        hasArrow: true,
        arrowIcon: Icons.keyboard_arrow_up,
        arrowAlignment: Alignment.centerRight,
        arrowColor: Theme.of(context).colorScheme.onPrimary,
        arrowSize: 24,
        onEnd: _animateFireEmoji,
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
        bottomSheetDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        body: Stack(
          children: [
            // Texto centralizado na tela
            const Center(
              child: Text(
                "This is the content of the page body",
                style: TextStyle(fontSize: 18),
              ),
            ),
            // Emoji piscante no topo da tela
            Align(
              alignment: Alignment(0, -0.6),
              child: _showEmoji ? bodyEmoji : const SizedBox.shrink(),
            ),
          ],
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
            itemCount: 30,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '🔥 This is the content of the sheet body $index',
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
<summary>ThemeColorsViewerPage</summary>
Simply define your theme first and instantiate the ThemeColorsViewerPage to view all colors with variable names:

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