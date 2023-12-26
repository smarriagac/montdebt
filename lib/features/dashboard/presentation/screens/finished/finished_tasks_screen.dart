import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishedTasksScreen extends ConsumerWidget {
  const FinishedTasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Material(
      child: Center(
        child: Text('Finished'),
      ),
    );
  }
}
