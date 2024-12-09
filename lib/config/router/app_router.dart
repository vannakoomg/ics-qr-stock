import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../features/login/presentation/login_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
@LazySingleton()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: LoginRoute.page, initial: true),
      ];
}
