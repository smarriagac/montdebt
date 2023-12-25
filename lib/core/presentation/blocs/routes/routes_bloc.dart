import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../router/routes.dart';

part 'routes_bloc.g.dart';

@riverpod
GoRouter goRouterConfig(GoRouterConfigRef ref) {
  return GoRouter(
    initialLocation: SignInRoute.path,
    routes: $appRoutes,
  );
}
