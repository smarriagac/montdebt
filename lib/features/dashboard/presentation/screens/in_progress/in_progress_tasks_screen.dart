import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InProgressTasksScreen extends ConsumerWidget {
  const InProgressTasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Material(
      child: Center(
        child: Text('InProgress'),
      ),
    );
  }
}
