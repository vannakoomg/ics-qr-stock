import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../features/login/presentation/login_page.dart';
import '../../features/scan_stock/presentation/pages/scan_stock_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
@LazySingleton()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: LoginRoute.page),
        CustomRoute(page: ScanStockRoute.page),
        CustomRoute(page: SplashRoute.page, initial: true)
      ];
}
