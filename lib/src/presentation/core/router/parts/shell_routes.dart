part of '../router.dart';

List<RouteBase> _homeRoutes(Ref ref) {
  return [
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      pageBuilder: (context, state) {
        return const MaterialPage(child: HomePage());
      },
    ),
    GoRoute(
      path: Routes.profile.path,
      name: Routes.profile.name,
      pageBuilder: (context, state) {
        return const MaterialPage(child: ProfilePage());
      },
    ),
  ];
}

