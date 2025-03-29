import 'package:flutter/material.dart';

class ThemeColorsViewerPage extends StatelessWidget {
  const ThemeColorsViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final colorMap = {
      'primary': colorScheme.primary,
      'onPrimary': colorScheme.onPrimary,
      'primaryContainer': colorScheme.primaryContainer,
      'onPrimaryContainer': colorScheme.onPrimaryContainer,
      'primaryFixed': colorScheme.primaryFixed,
      'primaryFixedDim': colorScheme.primaryFixedDim,
      'onPrimaryFixed': colorScheme.onPrimaryFixed,
      'onPrimaryFixedVariant': colorScheme.onPrimaryFixedVariant,
      'secondary': colorScheme.secondary,
      'onSecondary': colorScheme.onSecondary,
      'secondaryContainer': colorScheme.secondaryContainer,
      'onSecondaryContainer': colorScheme.onSecondaryContainer,
      'secondaryFixed': colorScheme.secondaryFixed,
      'secondaryFixedDim': colorScheme.secondaryFixedDim,
      'onSecondaryFixed': colorScheme.onSecondaryFixed,
      'onSecondaryFixedVariant': colorScheme.onSecondaryFixedVariant,
      'tertiary': colorScheme.tertiary,
      'onTertiary': colorScheme.onTertiary,
      'tertiaryContainer': colorScheme.tertiaryContainer,
      'onTertiaryContainer': colorScheme.onTertiaryContainer,
      'tertiaryFixed': colorScheme.tertiaryFixed,
      'tertiaryFixedDim': colorScheme.tertiaryFixedDim,
      'onTertiaryFixed': colorScheme.onTertiaryFixed,
      'onTertiaryFixedVariant': colorScheme.onTertiaryFixedVariant,
      'error': colorScheme.error,
      'onError': colorScheme.onError,
      'errorContainer': colorScheme.errorContainer,
      'onErrorContainer': colorScheme.onErrorContainer,
      'outline': colorScheme.outline,
      'outlineVariant': colorScheme.outlineVariant,
      'surface': colorScheme.surface,
      'onSurface': colorScheme.onSurface,
      'surfaceDim': colorScheme.surfaceDim,
      'surfaceBright': colorScheme.surfaceBright,
      'surfaceContainerLowest': colorScheme.surfaceContainerLowest,
      'surfaceContainerLow': colorScheme.surfaceContainerLow,
      'surfaceContainer': colorScheme.surfaceContainer,
      'surfaceContainerHigh': colorScheme.surfaceContainerHigh,
      'surfaceContainerHighest': colorScheme.surfaceContainerHighest,
      'onSurfaceVariant': colorScheme.onSurfaceVariant,
      'inverseSurface': colorScheme.inverseSurface,
      'onInverseSurface': colorScheme.onInverseSurface,
      'inversePrimary': colorScheme.inversePrimary,
      'shadow': colorScheme.shadow,
      'scrim': colorScheme.scrim,
      'surfaceTint': colorScheme.surfaceTint,
    };

    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('THEME COLORS'))),
      body: SingleChildScrollView(
        child: Column(
          children:
              colorMap.entries.map((entry) {
                return Container(
                  height: 80,
                  width: double.infinity,
                  color: entry.value,
                  alignment: Alignment.center,
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      color:
                          ThemeData.estimateBrightnessForColor(entry.value) ==
                                  Brightness.dark
                              ? Colors.white
                              : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
