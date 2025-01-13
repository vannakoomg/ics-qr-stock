// ignore_for_file: constant_identifier_names, unused_field
class BaseUrls {
  BaseUrls._();

  static const _LOCAL_BASE_URL = 'http://10.0.2.2:8000/api/';
  static const _DEV_BASE_URL = 'http://3.1.218.249/api/';

  static const _UAT_BASE_URL = 'http://...UAT.../';
  static const _PROD_BASE_URL = 'http://110.235.242.227:8069/api/';

  static const String baseUrl = _PROD_BASE_URL;
}

// #### PATH ###

class ApiEndpoints {
  ApiEndpoints._();
  static const notification = "/v1/notification";
}
