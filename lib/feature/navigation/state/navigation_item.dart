import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavigationItem {
  dashboard(
    label: 'ダッシュボード',
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard,
    path: '/',
  ),
  settings(
    label: '設定',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings,
    path: '/settings',
  ),
  ;

  const NavigationItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.path,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String path;
}

final currentNavigationItemProvider = StateProvider((ref) {
  return NavigationItem.dashboard;
});
