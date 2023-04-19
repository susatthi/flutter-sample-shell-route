import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  String get path => this == initial ? '/' : '/$name';

  static NavigationItem get initial => dashboard;

  static NavigationItem indexOf(int index) => NavigationItem.values[index];

  static NavigationItem? locationOf(String location) {
    if (location == '/') {
      return initial;
    }

    final path = Uri.parse(location).path;
    return NavigationItem.values
        .firstWhereOrNull((e) => e != initial && path.startsWith(e.path));
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
        context.go(item.path);
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
