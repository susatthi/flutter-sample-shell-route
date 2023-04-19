import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'component/navigation.dart';
import 'feature/cart/page/cart_page.dart';
import 'feature/dashboard/page/dashboard_page.dart';
import 'feature/error/page/error_page.dart';
import 'feature/settings/page/settings_details_page.dart';
import 'feature/settings/page/settings_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: NavigationItem.initial.path,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) =>
            ScaffoldWithNavigationBar(child: child),
        routes: [
          GoRoute(
            path: NavigationItem.dashboard.path,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DashboardPage()),
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'cart',
                pageBuilder: (context, state) => const MaterialPage(
                  child: CartPage(),
                  fullscreenDialog: true,
                ),
              )
            ],
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
