import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_route_info.freezed.dart';

@Freezed(when: FreezedWhenOptions(when: true))
class AppRouteInfo with _$AppRouteInfo {
  const factory AppRouteInfo.login() = _Login;
  const factory AppRouteInfo.scanStock() = _ScanStock;
}
