import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:sos_mobile/config/router/app_router.dart';

import 'app_route_info.dart';

abstract class BaseRouteInfoMapper {
  PageRouteInfo map(AppRouteInfo appRouteInfo);

  List<PageRouteInfo> mapList(List<AppRouteInfo> listAppRouteInfo) {
    return listAppRouteInfo.map(map).toList(growable: false);
  }
}

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      login: () => const LoginRoute(),
      scanStock: () => const ScanStockRoute(),
    );
  }
}
