import 'package:dio/dio.dart';

import '../../../constants/constants.dart';
import '../../../helper/local_data/storge_local.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String token =
        LocalStorage.getStringValue(SharedPreferenceKeys.accessToken);
    options.headers.addAll({'Authorization': 'Bearer $token'});
    super.onRequest(options, handler);
  }
}
