import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'component/navigation.dart';
import 'feature/dashboard/page/dashboard_page.dart';
import 'feature/error/page/error_page.dart';
import 'feature/settings/page/settings_details_page.dart';
import 'feature/settings/page/settings_page.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: NavigationItem.initial.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            ScaffoldWithNavigationBar(child: child),
        routes: [
          GoRoute(
            path: NavigationItem.dashboard.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DashboardPage()),
          ),
          GoRoute(
            path: NavigationItem.settings.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SettingsPage()),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = int.tryParse(state.params['id'] ?? '0');
                  return SettingsDetailsPage(id: id);
                },
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error),
  );
});
