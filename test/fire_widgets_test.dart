import 'package:fire_widgets/fire_widgets.dart';
import 'package:flutter/material.dart';

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
