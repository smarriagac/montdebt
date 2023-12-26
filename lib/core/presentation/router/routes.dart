import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/authentication/presentation/screens/sign_in/sign_in_screen.dart';
import '../../../features/authentication/presentation/screens/sign_up/sign_up_screen.dart';
import '../../../features/dashboard/presentation/screens/finished/finished_tasks_screen.dart';
import '../../../features/dashboard/presentation/screens/in_progress/in_progress_tasks_screen.dart';
import '../../../features/dashboard/presentation/screens/to_do/to_do_tasks_screen.dart';
import '../../../features/dashboard/presentation/widgets/dashboard_scaffold.dart';
import '../../../features/user_profile/presentation/screens/user_profile_screen.dart';

part 'routes.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedGoRoute<SignInRoute>(
  path: SignInRoute.path,
)
class SignInRoute extends GoRouteData {
  static const path = '/sign-in';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

@TypedGoRoute<SignUpRoute>(
  path: SignUpRoute.path,
)
class SignUpRoute extends GoRouteData {
  static const path = '/sign-up';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}

@TypedStatefulShellRoute<DashboardShellRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ToDoRoute>(path: ToDoRoute.path),
        TypedGoRoute<InProgressRoute>(path: InProgressRoute.path),
        TypedGoRoute<FinishedRoute>(path: FinishedRoute.path),
      ],
    )
  ],
)
class DashboardShellRoute extends StatefulShellRouteData {
  const DashboardShellRoute();
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return DasboardScaffold(state: state, child: navigationShell);
  }
}

class ToDoRoute extends GoRouteData {
  static const path = '/to-do';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ToDoTasksScreen();
  }
}

class InProgressRoute extends GoRouteData {
  static const path = '/in-progress';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const InProgressTasksScreen();
  }
}

class FinishedRoute extends GoRouteData {
  static const path = '/finished';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FinishedTasksScreen();
  }
}

@TypedGoRoute<ProfileRoute>(
  path: ProfileRoute.path,
)
class ProfileRoute extends GoRouteData {
  static const path = '/profile';

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserprofileScreen();
  }
}
