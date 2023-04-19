// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootShellRouteData,
    ];

RouteBase get $rootShellRouteData => ShellRouteData.$route(
      factory: $RootShellRouteDataExtension._fromState,
      navigatorKey: RootShellRouteData.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $DashboardRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'cart',
              factory: $CartRouteDataExtension._fromState,
              parentNavigatorKey: CartRouteData.$parentNavigatorKey,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/settings',
          factory: $SettingsRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':id',
              factory: $SettingsDetailsRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $RootShellRouteDataExtension on RootShellRouteData {
  static RootShellRouteData _fromState(GoRouterState state) =>
      const RootShellRouteData();
}

extension $DashboardRouteDataExtension on DashboardRouteData {
  static DashboardRouteData _fromState(GoRouterState state) =>
      const DashboardRouteData();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $CartRouteDataExtension on CartRouteData {
  static CartRouteData _fromState(GoRouterState state) => const CartRouteData();

  String get location => GoRouteData.$location(
        '/cart',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SettingsRouteDataExtension on SettingsRouteData {
  static SettingsRouteData _fromState(GoRouterState state) =>
      const SettingsRouteData();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SettingsDetailsRouteDataExtension on SettingsDetailsRouteData {
  static SettingsDetailsRouteData _fromState(GoRouterState state) =>
      SettingsDetailsRouteData(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/settings/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
