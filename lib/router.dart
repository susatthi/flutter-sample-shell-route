import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'component/navigation.dart';
import 'feature/cart/page/cart_page.dart';
import 'feature/dashboard/page/dashboard_page.dart';
import 'feature/error/page/error_page.dart';
import 'feature/settings/page/settings_details_page.dart';
import 'feature/settings/page/settings_page.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: $appRoutes,
    errorBuilder: (context, state) => ErrorPage(error: state.error),
  );
});

@TypedShellRoute<RootShellRouteData>(
  routes: [
    TypedGoRoute<DashboardRouteData>(
      path: DashboardRouteData.path,
      routes: [
        TypedGoRoute<CartRouteData>(
          path: CartRouteData.path,
        ),
      ],
    ),
    TypedGoRoute<SettingsRouteData>(
      path: SettingsRouteData.path,
      routes: [
        TypedGoRoute<SettingsDetailsRouteData>(
          path: SettingsDetailsRouteData.path,
        ),
      ],
    ),
  ],
)
class RootShellRouteData extends ShellRouteData {
  const RootShellRouteData();

  static final $navigatorKey = _shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return ScaffoldWithNavigationBar(child: navigator);
  }
}

class DashboardRouteData extends GoRouteData {
  const DashboardRouteData();

  static const path = '/';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: DashboardPage());
  }
}

class CartRouteData extends GoRouteData {
  const CartRouteData();

  static const path = 'cart';
  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: CartPage(),
      fullscreenDialog: true,
    );
  }
}

class SettingsRouteData extends GoRouteData {
  const SettingsRouteData();

  static const path = '/settings';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SettingsPage());
  }
}

class SettingsDetailsRouteData extends GoRouteData {
  const SettingsDetailsRouteData({
    required this.id,
  });

  final String id;

  static const path = ':id';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingsDetailsPage(id: int.tryParse(id));
  }
}
