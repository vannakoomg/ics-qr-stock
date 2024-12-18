import 'package:injectable/injectable.dart';
import 'package:sos_mobile/core/constants/api_constants.dart';

abstract class IConfig {
  String get baseUrl;

  Map<String, String> get headers;
}

@Injectable(as: IConfig)
class AppConfig extends IConfig {
  @override
  String get baseUrl => BaseUrls.baseUrl;

  @override
  Map<String, String> get headers => {
        'Content-Type': 'text/plain',
        'accept': 'application/json',
      };
}
