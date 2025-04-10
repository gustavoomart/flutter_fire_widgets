import 'package:flutter/material.dart';
typedef SnapshotWidgetBuilder<T> = Widget Function(BuildContext context, T data);

class SimpleFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final SnapshotWidgetBuilder<T> onLoaded;
  final Widget? onLoading;
  final Widget? onEmpty;
  final Widget Function(Object error)? onError;

  const SimpleFutureBuilder({
    super.key,
    required this.future,
    required this.onLoaded,
    this.onLoading,
    this.onEmpty,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return onLoading ?? const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return onError?.call(snapshot.error!) ??
              Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || (snapshot.data is List && (snapshot.data as List).isEmpty)) {
          return onEmpty ?? const Center(child: Text('Nothing to show'));
        } else {
          return onLoaded(context, snapshot.data as T);
        }
      },
    );
  }
}
