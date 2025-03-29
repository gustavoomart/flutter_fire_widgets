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
