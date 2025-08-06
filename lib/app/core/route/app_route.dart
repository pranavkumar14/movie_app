import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: RouteWrapperRoute.page,
            path: '/',
            initial: true,
            children: [
              AutoRoute(page: HomeRoute.page, path: 'home',initial: true),
              AutoRoute(page: MovieDetailRoute.page, path: 'details'),
              AutoRoute(page: SearchResultRoute.page, path: 'search'),
              AutoRoute(page: MovieListWidget.page, path: 'list'),
            ]),
      ];

  List<AutoRoute> get router => routes;
}
