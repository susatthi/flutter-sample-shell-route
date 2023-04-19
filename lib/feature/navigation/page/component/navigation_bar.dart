import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../state/navigation_item.dart';

class AppNavigationBar extends ConsumerWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentNavigationItemProvider);
    return NavigationBar(
      selectedIndex: item.index,
      destinations: NavigationItem.values
          .map((item) => _NavigationDestination(item: item))
          .toList(),
      onDestinationSelected: (index) {
        final item = NavigationItem.values[index];
        context.go(item.path);
        ref.read(currentNavigationItemProvider.notifier).update(
              (state) => item,
            );
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
