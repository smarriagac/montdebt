import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../router/routes.dart';
import '../session/session_bloc.dart';

part 'routes_bloc.g.dart';

@Riverpod(keepAlive: true)
Future<GoRouter> router(RouterRef ref) async {
  // await ref.read(sessionBlocProvider.notifier).init();

  final result = ref.watch(sessionBlocProvider);

  log('SESSION PROIVIDER: $result ');

  return GoRouter(
    initialLocation: result.maybeWhen(
      loaded: (user) => user == null ? SignInRoute.path : HomeRoute.path,
      orElse: () => SignInRoute.path,
    ),
    routes: $appRoutes,
  );
}
