import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'blocs/routes/routes_bloc.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GoRouter> gorouter = ref.watch(routerProvider);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: gorouter.when(
        loading: () => const CircularProgressIndicator(),
        error: (Object error, StackTrace stackTrace) => Center(
          child: Text('$error'),
        ),
        data: (GoRouter routerConfig) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          routerConfig: routerConfig,
        ),
      ),
    );
  }
}
