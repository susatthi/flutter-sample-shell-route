import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router.dart';

enum NavigationItem {
  dashboard(
    label: 'ダッシュボード',
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard,
  ),
  settings(
    label: '設定',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings,
  ),
  ;

  const NavigationItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;

  String get path {
    switch (this) {
      case NavigationItem.dashboard:
        return DashboardRouteData.path;
      case NavigationItem.settings:
        return SettingsRouteData.path;
    }
  }

  void go(BuildContext context) {
    switch (this) {
      case NavigationItem.dashboard:
        const DashboardRouteData().go(context);
        break;
      case NavigationItem.settings:
        const SettingsRouteData().go(context);
        break;
    }
  }

  static NavigationItem indexOf(int index) => NavigationItem.values[index];

  static NavigationItem? locationOf(String location) {
    final path = Uri.parse(location).path;
    return NavigationItem.values
        .sorted((a, b) => b.path.length - a.path.length)
        .firstWhereOrNull((e) => path.startsWith(e.path));
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const _NavigationBar(),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar();

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).location;
    final item =
        NavigationItem.locationOf(location) ?? NavigationItem.dashboard;
    return NavigationBar(
      selectedIndex: item.index,
      destinations: NavigationItem.values
          .map((item) => _NavigationDestination(item: item))
          .toList(),
      onDestinationSelected: (index) {
        final item = NavigationItem.indexOf(index);
        item.go(context);
      },
    );
  }
}

class _NavigationDestination extends StatelessWidget {
  const _NavigationDestination({
    required this.item,
  });

  final NavigationItem item;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(item.icon),
      selectedIcon: Icon(item.selectedIcon),
      label: item.label,
    );
  }
}
