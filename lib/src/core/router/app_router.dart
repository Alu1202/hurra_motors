import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../fetaures/login/ui/login_screen.dart';
import '../../fetaures/new_job/ui/create_new_job_screen.dart';
import '../../fetaures/splash/splash_screen.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(this.context);
  final BuildContext context;
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: SplashScreen.route, initial: true),

    AutoRoute(page: LoginRoute.page, path: LoginScreen.route),
    AutoRoute(
      page: DashboardRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SettingRoute.page),
      ],
    ),
    AutoRoute(
      page: CreateNewJobRoute.page,
      path: CreateNewJobScreen.route,
    ),
  ];
  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
