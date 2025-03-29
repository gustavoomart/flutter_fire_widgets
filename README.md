# 🔥 Fire Widget's 🔥

A collection of custom widgets for Flutter.


## Features

- ExpandableBottomSheetPage: A full page widget with body and an expandable bottom menu

## Getting started

To use this package in your Flutter project, follow these steps:

### 1. Add the dependency

In your `pubspec.yaml` file, add the following dependency:

```yaml
dependencies:
  flutter:
    sdk: flutter
  fire_widgets: ^0.0.1  # Replace with the latest version
```
### 2. Install dependencies
If you are using any of the editors supported by Flutter a pop-up should appear to install the dependencies. If not, run the following command in the terminal:
```bash
flutter pub get
```
***
# Widget's

<details>
<summary>## Expandable Bottom Sheet Page</summary>

### Description
This widget consists of a complete page, with a body and an expandable bottom menu.

### Usage

Use it like any other Flutter widget. But be aware that it is a complete page, so place it as the root of your page. If you want, you can place it inside a Scaffold or another base at this same type.
Here is an usage example:

```dart
void main() {
  runApp(const ExpandableBottomSheetApp());
}

class ExpandableBottomSheetApp extends StatelessWidget {
  const ExpandableBottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
      ),
      useMaterial3: true,
    );

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Expandable Bottom Sheet Example',
            ),
          ),
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),

        body: ExpandableBottomSheetPage(
          arrowIcon: Icons.keyboard_arrow_up,
          animationDuration: 400,
          headerHeightPercentage: 0.05,
          openedHeightPercentage: 0.5,
          arrowRightMargin: 8,
          arrowColor: theme.colorScheme.onPrimary,
          arrowSize: 24,
          headerDecoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary,
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),

          body: Center(
            child: Text(
              'This is the main content of the page',
              style: theme.textTheme.bodyLarge,
            ),
          ),

          header: Center(
            child: Text(
              'THIS IS THE HEADER',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
              
            ),
          ),
          
          bottomSheetBody: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'This is the bottom sheet body',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        'Item $index',
                        style: theme.textTheme.bodyMedium,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
</details>
