import 'package:auto_route/auto_route.dart';
import 'package:my_template/routing/route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: CreateVaultRoute.page),
        AutoRoute(page: AuthCreatePinRoute.page),
      ];
  @override
  List<AutoRouteGuard> get guards => [];
}
