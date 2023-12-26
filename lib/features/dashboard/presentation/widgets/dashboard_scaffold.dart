import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/router/routes.dart';

class DasboardScaffold extends StatelessWidget {
  const DasboardScaffold({
    super.key,
    required this.state,
    required this.child,
  });
  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final path = state.uri.path;

    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: const CircleAvatar(),
            onTap: () => ProfileRoute().push(context),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          final path = DashboardRoutes.values[index].path;
          context.go(path);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.run_circle_rounded),
            label: 'In Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all_rounded),
            label: 'Finished',
          ),
        ],
      ),
    );
  }
}

enum DashboardRoutes {
  toDo(ToDoRoute.path),
  inProgress(InProgressRoute.path),
  finished(FinishedRoute.path);

  const DashboardRoutes(this.path);
  final String path;
}
